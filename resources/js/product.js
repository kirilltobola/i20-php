window.onload = function () {
    let cnt = document.getElementById('cnt');

    let plus_button = document.getElementById("plus");
    let minus_button = document.getElementById("minus");
    increase_count(plus_button, minus_button, cnt);
    decrease_count(minus_button, cnt);

    let buy_btn = document.getElementById('buy-btn');
    let notification_container = document.getElementById("notification-container");
    notification_container.onclick = function () {
        fade_out(this);
    }
    let notification_content = document.getElementById("notification-content");
    buy(buy_btn, notification_container, notification_content);

    let scroll_images = document.getElementsByClassName("scroll__item");
    let zoomed_image = document.getElementById("zoomed-image");
    zoom(scroll_images, zoomed_image);
}

function increase_count(plus_btn, minus_btn, cnt) {
    plus_btn.onclick = function () {
        if (minus_btn.disabled) {
            minus_btn.disabled = false;
            minus_btn.style.opacity = "1";
        }

        let cnt_value = parseInt(cnt.value);
        cnt.value = (++cnt_value).toString();
    }
}

function decrease_count(minus_btn, cnt) {
    minus_btn.onclick = function () {
        let cnt_value = parseInt(cnt.value);

        if (cnt_value - 1 === 1) {
            minus_btn.disabled = true;
            minus_btn.style.opacity = "0.5";
        }
        if (cnt_value > 1) {
            cnt.value = (--cnt_value).toString();
        }
    }
}

function buy(buy_btn, notification_container, notification_content) {
    let timeOutId = null;
    buy_btn.onclick = function () {
        clearTimeout(timeOutId);
        let cnt = document.getElementById('cnt').value;
        notification_content.innerHTML = "В корзину добавлено " + cnt + " вещей";

        notification_container.style.display = 'block';
        notification_container.style.opacity = "1";
        timeOutId = setTimeout(function () {
            fade_out(notification_container);
        }, 3000);
    }
}

function fade_out(element) {
    let opacity = 1;
    let timer = setInterval(function () {
        if (opacity <= 0.1) {
            clearInterval(timer);
            element.style.display = "none";
            opacity = 1;
        }
        element.style.opacity = opacity.toString();
        element.style.filter = "alpha(opacity=" + opacity*100 + ")";
        opacity -= opacity * 0.4;
    }, 40);
}

function zoom(scroll_images, zoomed_image) {
    for (let i = 0; i < scroll_images.length; i++) {
        scroll_images[i].onmouseover = function () {
            zoomed_image.src = this.children.item(0).src;
        }
    }
}
