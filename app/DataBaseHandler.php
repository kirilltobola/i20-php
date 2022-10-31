<?php
namespace App;

use PDO;
use PDOException;
use PDOStatement;

class DataBaseHandler
{
    private array $db_config;
    private ?PDO $db;
    private array $queries;

    public function __construct()
    {
        $this->db_config = parse_ini_file(dirname(__DIR__, 1)."/config/app.ini");
        $this->queries = parse_ini_file(dirname(__DIR__, 1)."/config/db.ini");

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
        $query = $this->db->prepare($this->queries['categories_query']);
        return $this->executeQuery($query);
    }

    public function getProducts(int $category_id, int $limit=12, int $page=0): array
    {
        // TODO: update sql queries
        $query = $this->db->prepare($this->queries['category_products']);
        $offset = $limit * ($page - 1);
        $query->bindParam(1, $category_id, PDO::PARAM_INT);
        $query->bindParam(2, $limit, PDO::PARAM_INT);
        $query->bindParam(3, $offset, PDO::PARAM_INT);
        return $this->executeQuery($query);
    }

    public function getProduct(int $product_id): array
    {
        $params = ['product_id' => $product_id];
        $query_main_info = $this->db->prepare($this->queries['product_main_info']);
        $main_info = $this->executeQuery($query_main_info, $params);

        $query_images = $this->db->prepare($this->queries['product_images']);
        $images = $this->executeQuery($query_images, $params);

        $query_categories = $this->db->prepare($this->queries['product_categories']);
        $categories = $this->executeQuery($query_categories, $params);
        return [
            'main_info' => $main_info,
            'images' => $images,
            'categories' => $categories
        ];
    }

    public function saveFeedback(array $params): void
    {
        $query = $this->db->prepare($this->queries['save_feedback']);
        try {
            $query->execute($params);
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