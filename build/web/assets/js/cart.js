// Cart functionality
let cart = [];

// Load cart from sessionStorage when page loads
document.addEventListener('DOMContentLoaded', function() {
    loadCart();
    updateCartDisplay();
    updateNotificationBadge(cart.length);
    const addToMenuButtons = document.querySelectorAll('.add-to-menu-btn');
    addToMenuButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            const menuItem = this.closest('.menu-item');
            const menuId = this.dataset.menuId;
            const menuName = this.dataset.menuName;
            const menuPrice = this.dataset.menuPrice;
            addToCart(menuId, menuName, menuPrice);
        });
    });

    // Add event listeners for remove buttons if we're on the cart page
    const removeButtons = document.querySelectorAll('.remove-from-cart-btn');
    removeButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            const menuId = this.dataset.menuId;
            removeFromCart(menuId);
        });
    });

    // Quantity decrease buttons
    document.querySelectorAll('.quantity-btn').forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            const form = this.closest('form');
            const menuId = form.querySelector('input[name="menuID"]').value;
            const action = form.querySelector('input[name="action"]').value;
            updateCartQuantity(menuId, action);
        });
    });

    // Handle quantity update forms
    document.querySelectorAll('.quantity-control form').forEach(form => {
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            const menuId = this.querySelector('input[name="menuID"]').value;
            const action = this.querySelector('input[name="action"]').value;
            console.log('Form submitted:', menuId, action);
            updateCartQuantity(menuId, action);
        });
    });

    // Handle decrease quantity button
    document.querySelectorAll('.decrease-btn').forEach(button => {
        button.addEventListener('click', function() {
            const menuId = this.dataset.menuId;
            updateCartQuantity(menuId, 'decrease');
        });
    });

    // Handle increase quantity button
    document.querySelectorAll('.increase-btn').forEach(button => {
        button.addEventListener('click', function() {
            const menuId = this.dataset.menuId;
            updateCartQuantity(menuId, 'increase');
        });
    });
});

// Add item to cart
function addToCart(menuId, menuName, menuPrice) {
    fetch('AddToCart', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `menuID=${encodeURIComponent(menuId)}&menuName=${encodeURIComponent(menuName)}&menuPrice=${encodeURIComponent(menuPrice)}`
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            showNotification(data.message);
            updateNotificationBadge(data.totalItems);
        } else {
            showNotification(data.message || 'Có lỗi xảy ra khi thêm vào giỏ hàng', 'danger');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        showNotification('Có lỗi xảy ra khi thêm vào giỏ hàng', 'danger');
    });
}

// Remove item from cart
function removeFromCart(menuId) {
    fetch('RemoveFromCart', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `menuID=${encodeURIComponent(menuId)}`
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            window.location.reload();
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

// Update quantity
function updateQuantity(itemId, newQuantity) {
    const item = cart.find(item => item.id === itemId);
    if (item) {
        item.quantity = Math.max(1, parseInt(newQuantity));
        saveCart();
        updateCartDisplay();
    }
}

// Function to update cart quantity
function updateCartQuantity(menuId, action) {
    fetch('UpdateCart', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `menuID=${encodeURIComponent(menuId)}&action=${encodeURIComponent(action)}`
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            window.location.reload();
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

// Save cart to sessionStorage
function saveCart() {
    sessionStorage.setItem('cart', JSON.stringify(cart));
}

// Load cart from sessionStorage
function loadCart() {
    const savedCart = sessionStorage.getItem('cart');
    if (savedCart) {
        cart = JSON.parse(savedCart);
    }
}

// Update cart display
function updateCartDisplay() {
    const cartItems = document.getElementById('cartItems');
    const subtotalElement = document.getElementById('subtotal');
    const totalElement = document.getElementById('total');
    
    if (!cartItems) return; // Not on cart page
    
    cartItems.innerHTML = '';
    let subtotal = 0;
    
    cart.forEach(item => {
        const total = item.price * item.quantity;
        subtotal += total;
        
        cartItems.innerHTML += `
            <tr>
                <td>${item.name}</td>
                <td>${formatPrice(item.price)}₫</td>
                <td>
                    <div class="input-group">
                        <button class="quantity-btn btn btn-sm btn-secondary" type="button">-</button>
                        <input type="number" min="1" value="${item.quantity}" class="form-control" style="width: 80px">
                        <button class="quantity-btn btn btn-sm btn-secondary" type="button">+</button>
                    </div>
                </td>
                <td>${formatPrice(total)}₫</td>
                <td>
                    <button onclick="removeFromCart('${item.id}')"
                        class="btn btn-danger btn-sm">
                        <i class="bi bi-trash"></i>
                    </button>
                </td>
            </tr>
        `;
    });
    
    if (subtotalElement) subtotalElement.textContent = formatPrice(subtotal) + '₫';
    if (totalElement) totalElement.textContent = formatPrice(subtotal) + '₫';
}

// Format price with thousand separator
function formatPrice(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

// Function to show notification
function showNotification(message, type = 'success') {
    const notification = document.createElement('div');
    notification.className = `alert alert-${type} alert-dismissible fade show`;
    notification.role = 'alert';
    notification.style.position = 'fixed';
    notification.style.top = '0px';
    notification.style.left = '50%';
    notification.style.transform = 'translateX(-50%)';
    notification.style.zIndex = '9999';
    notification.style.minWidth = '300px';
    notification.style.textAlign = 'center';
    notification.innerHTML = `
        ${message}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    `;
    document.body.appendChild(notification);

    // Auto dismiss after 1.5 seconds
    setTimeout(() => {
        notification.remove();
    }, 1500);
}

// Function to update notification badge
function updateNotificationBadge(totalItems) {
    const badge = document.querySelector('.notification-badge');
    if (totalItems > 0) {
        if (badge) {
            badge.textContent = totalItems;
        } else {
            const cartBtn = document.querySelector('.book-a-table-btn .bi-cart').parentElement;
            const newBadge = document.createElement('span');
            newBadge.className = 'notification-badge';
            newBadge.textContent = totalItems;
            cartBtn.appendChild(newBadge);
        }
    } else if (badge) {
        badge.remove();
    }
}

// Checkout function
function checkout() {
    if (cart.length === 0) {
        alert('Giỏ hàng của bạn đang trống');
        return;
    }
    
    // Here you would typically send the cart data to your server
    alert('Cảm ơn bạn đã đặt hàng! Chúng tôi sẽ liên hệ với bạn sớm.');
    cart = [];
    saveCart();
    updateCartDisplay();
}
