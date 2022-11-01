<?php
namespace App;

use PDO;
use PDOException;
use PDOStatement;

class DataBaseHandler
{
    private array $db_config;
    private ?PDO $db;

    public function __construct()
    {
        $this->db_config = parse_ini_file(dirname(__DIR__)."/config/app.ini");

        $host = $this->db_config['db_host'];
        $port = $this->db_config['db_port'];
        $dbname = $this->db_config['db_name'];
        $username = $this->db_config['db_user'];
        $password = $this->db_config['db_password'];

        $dsn = "mysql:host={$host};port={$port};dbname={$dbname};charset=UTF8";
        $this->db = new PDO($dsn, $username, $password);
    }

    public function getCategories(): array
    {
        $query = $this->db->prepare('
            SELECT
                c.id category_id,
                c.title category_title,
                c.description category_description,
                COUNT(T.product_id) count_products
            FROM (
                SELECT cp.category_id, cp.product_id
                FROM category_product cp
                UNION
                SELECT p.main_category_id category_id, p.id product_id
                FROM products p
            ) AS T
            JOIN categories c ON
            c.id = category_id
            JOIN products p ON
            T.product_id = p.id AND p.active = 1
            GROUP BY category_id
            ORDER BY count_products DESC;');
        return $this->executeQuery($query);
    }

    public function getProducts(int $category_id, int $limit=12, int $page=0): array
    {
        $query = $this->db->prepare('
            SELECT
                product_id,
                p.title product_title,
                p.main_category_id main_category_id,
                c.title main_category_title,
                url image_url,
                alt image_alt
            FROM (
                SELECT cp.category_id, cp.product_id
                FROM category_product cp
                UNION
                SELECT p.main_category_id category_id, p.id product_id
                FROM products p
            ) AS T
            JOIN products p
            ON T.product_id = p.id and p.active = 1 AND T.category_id = ?
            JOIN categories c
            ON c.id = p.main_category_id
            JOIN images i
            ON i.id = p.main_image_id
            LIMIT ? OFFSET ?;');
        $offset = $limit * ($page - 1);
        $query->bindParam(1, $category_id, PDO::PARAM_INT);
        $query->bindParam(2, $limit, PDO::PARAM_INT);
        $query->bindParam(3, $offset, PDO::PARAM_INT);
        return $this->executeQuery($query);
    }

    public function countProductsInCategory(int $category_id): array
    {
        $params = ['category_id' => $category_id];
        $query = $this->db->prepare('
            SELECT
                COUNT(category_id) products
            FROM
                (
                SELECT
                    cp.category_id,
                    cp.product_id
                FROM
                    category_product cp
                UNION
                SELECT
                    p.main_category_id category_id,
                    p.id product_id
                FROM
                    products p
            ) AS T
            JOIN products p ON
            T.product_id = p.id AND p.active = 1
            WHERE category_id = :category_id;
        ');
        return $this->executeQuery($query,$params);
    }

    public function getCategory(int $category_id): array
    {
        $query = $this->db->prepare('
            SELECT id, title, description
            FROM categories
            WHERE id = :category_id;
        ');
        $params = ['category_id' => $category_id];
        return $this->executeQuery($query, $params);
    }

    public function getProduct(int $product_id): array
    {
        $params = ['product_id' => $product_id];
        $query_main_info = $this->db->prepare('
            SELECT 
                p.id product_id, 
                p.title product_title,
                p.price,
                p.price_discount,
                p.price_promo,
                p.description,
                c.id main_category_id,
                c.title main_category_title,
                i.url main_image_url,
                i.alt main_image_alt
            FROM products p
            JOIN images i
            ON p.active = 1 AND p.main_image_id = i.id AND p.id = :product_id
            JOIN categories c
            ON p.main_category_id = c.id;
        ');
        $main_info = $this->executeQuery($query_main_info, $params);

        $query_images = $this->db->prepare('
            SELECT i.url, i.alt
            FROM images i
            JOIN product_image pi
            ON i.id = pi.image_id
            JOIN products p
            ON pi.product_id = p.id AND p.id = :product_id;
        ');
        $images = $this->executeQuery($query_images, $params);

        $query_categories = $this->db->prepare('
            SELECT c.id, c.title, c.description
            FROM categories c
            JOIN category_product cp
            ON c.id = cp.category_id
            JOIN products p
            ON cp.product_id = p.id AND p.id = :product_id;
        ');
        $categories = $this->executeQuery($query_categories, $params);
        return [
            'main_info' => $main_info,
            'images' => $images,
            'categories' => $categories
        ];
    }

    public function saveFeedback(array $params): void
    {
        $mapped_params = array_map("htmlspecialchars", $params);
        $query = $this->db->prepare('
            INSERT INTO `feedback`(
                `name`,
                `email`,
                `date_of_birth`,
                `sex`,
                `subject`,
                `point`,
                `agree`
            )
            VALUES(
                :username,
                :email,
                :date_of_birth,
                :sex,
                :subject,
                :point,
                :agree
            );
        ');
        try {
            $query->execute($mapped_params);
        } catch (PDOException $e) {
            var_dump($e->getMessage());
            abort(500);
            die();
        }
    }

    private function executeQuery(PDOStatement $query, $params=null): array
    {
        try {
            $query->execute($params);
            return $query->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            var_dump($e->getMessage());
            abort(500);
            die();
        }
    }

    public function __destruct()
    {
        $this->db = null;
    }
}