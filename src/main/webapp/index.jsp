<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <title>NexusShop | Modern E‑Commerce Experience</title>
    <!-- Google Fonts + Font Awesome 6 (free) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,500;14..32,600;14..32,700&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: #fefefe;
            font-family: 'Inter', sans-serif;
            color: #111827;
            scroll-behavior: smooth;
            overflow-x: hidden;
        }

        /* modern glassmorphic + organic feel */
        :root {
            --primary-deep: #0b2b40;
            --accent-electric: #3bc9db;
            --accent-glow: #5ee0fa;
            --surface-glass: rgba(255, 255, 255, 0.92);
            --card-shadow: 0 25px 35px -12px rgba(0, 0, 0, 0.08), 0 1px 2px rgba(0, 0, 0, 0.02);
            --gradient-hero: linear-gradient(125deg, #0b2b40 0%, #124c5e 100%);
            --radius-xl: 28px;
            --radius-md: 20px;
            --transition-smooth: all 0.3s cubic-bezier(0.2, 0.9, 0.4, 1.1);
        }

        .container {
            max-width: 1280px;
            margin: 0 auto;
            padding: 0 28px;
        }

        /* header modern */
        header {
            background: rgba(255, 255, 255, 0.96);
            backdrop-filter: blur(12px);
            position: sticky;
            top: 0;
            z-index: 100;
            border-bottom: 1px solid rgba(59, 201, 219, 0.2);
        }

        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 24px;
            padding: 14px 0;
            flex-wrap: wrap;
        }

        .brand {
            font-family: 'Space Grotesk', monospace;
            font-weight: 700;
            font-size: 1.8rem;
            letter-spacing: -0.02em;
            background: linear-gradient(135deg, #0b2b40, #1f6d7a);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .brand i {
            background: none;
            -webkit-background-clip: unset;
            color: var(--accent-electric);
            margin-right: 6px;
        }

        nav.main-nav ul {
            display: flex;
            gap: 28px;
            list-style: none;
        }

        nav.main-nav ul li a {
            text-decoration: none;
            font-weight: 500;
            color: #1f2a3e;
            transition: 0.2s;
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.95rem;
        }

        nav.main-nav ul li a i {
            font-size: 1rem;
            color: var(--accent-electric);
        }

        nav.main-nav ul li a:hover {
            color: #0f6b7c;
            transform: translateY(-2px);
        }

        .search {
            background: #f1f5f9;
            border-radius: 60px;
            padding: 8px 18px;
            display: flex;
            align-items: center;
            gap: 10px;
            backdrop-filter: blur(4px);
            transition: 0.2s;
            border: 1px solid transparent;
        }

        .search:focus-within {
            border-color: var(--accent-electric);
            background: white;
            box-shadow: 0 2px 8px rgba(59, 201, 219, 0.2);
        }

        .search input {
            background: transparent;
            border: none;
            outline: none;
            width: 200px;
            font-size: 0.85rem;
        }

        .header-actions {
            display: flex;
            gap: 16px;
        }

        .cart {
            position: relative;
            font-size: 1.3rem;
            cursor: pointer;
            transition: 0.2s;
        }

        .cart-count {
            position: absolute;
            top: -10px;
            right: -14px;
            background: #ff5e6e;
            color: white;
            font-size: 11px;
            font-weight: bold;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: monospace;
        }

        .mobile-toggle {
            display: none;
            font-size: 1.8rem;
            background: none;
            border: none;
            cursor: pointer;
        }

        /* hero section with modern glass */
        .hero {
            background: var(--gradient-hero);
            margin: 24px 20px 0 20px;
            border-radius: var(--radius-xl);
            padding: 64px 32px;
            text-align: center;
            color: white;
            position: relative;
            overflow: hidden;
            box-shadow: 0 18px 30px -12px rgba(0, 0, 0, 0.2);
        }

        .hero::after {
            content: '';
            position: absolute;
            top: -30%;
            right: -10%;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(59,201,219,0.2) 0%, rgba(0,0,0,0) 70%);
            border-radius: 50%;
        }

        .hero h1 {
            font-size: 3.2rem;
            font-weight: 700;
            font-family: 'Space Grotesk', sans-serif;
            letter-spacing: -0.02em;
            margin-bottom: 16px;
        }

        .hero p {
            max-width: 600px;
            margin: 0 auto 32px;
            opacity: 0.9;
            font-size: 1.1rem;
        }

        .btn-group {
            display: flex;
            gap: 18px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            padding: 12px 28px;
            border-radius: 60px;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: 0.2s;
            font-size: 0.95rem;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .btn-primary {
            background: white;
            color: #0b2b40;
            box-shadow: 0 5px 12px rgba(0, 0, 0, 0.1);
        }

        .btn-primary:hover {
            background: var(--accent-electric);
            color: #0b2b40;
            transform: scale(1.02);
        }

        .btn-outline-light {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.4);
            color: white;
        }

        /* section headers */
        .section {
            padding: 60px 0 40px;
        }

        .section-header {
            text-align: center;
            margin-bottom: 44px;
        }

        .section-header h2 {
            font-size: 2.2rem;
            font-weight: 700;
            background: linear-gradient(135deg, #1e3c4a, #2d7f8c);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            display: inline-block;
        }

        .section-header p {
            color: #5b6e8c;
            margin-top: 10px;
        }

        /* category grid with neon hover */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 24px;
        }

        .cat-card {
            background: white;
            padding: 28px 12px;
            text-align: center;
            border-radius: 32px;
            box-shadow: var(--card-shadow);
            transition: var(--transition-smooth);
            cursor: pointer;
            border: 1px solid rgba(59, 201, 219, 0.1);
        }

        .cat-card i {
            font-size: 2.4rem;
            color: var(--accent-electric);
            margin-bottom: 12px;
            display: inline-block;
        }

        .cat-card:hover {
            transform: translateY(-8px);
            border-color: var(--accent-electric);
            box-shadow: 0 30px 40px -20px rgba(59, 201, 219, 0.3);
        }

        /* product grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(270px, 1fr));
            gap: 28px;
        }

        .product-card {
            background: white;
            border-radius: 28px;
            overflow: hidden;
            transition: 0.25s ease;
            box-shadow: var(--card-shadow);
            position: relative;
        }

        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 30px 35px -18px rgba(0, 0, 0, 0.15);
        }

        .product-img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            transition: 0.4s;
        }

        .product-card:hover .product-img {
            transform: scale(1.02);
        }

        .product-info {
            padding: 18px 18px 20px;
        }

        .product-title {
            font-weight: 700;
            font-size: 1.1rem;
        }

        .price-wrap {
            display: flex;
            align-items: baseline;
            gap: 12px;
            margin: 12px 0;
        }

        .current-price {
            font-size: 1.45rem;
            font-weight: 800;
            color: #0e4b5c;
        }

        .old-price {
            text-decoration: line-through;
            color: #94a3b8;
            font-size: 0.85rem;
        }

        .rating {
            color: #fbbf24;
            font-size: 0.8rem;
            margin: 8px 0;
        }

        .add-cart-btn {
            width: 100%;
            background: #0f2e3a;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 40px;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            cursor: pointer;
            transition: 0.2s;
        }

        .add-cart-btn:hover {
            background: var(--accent-electric);
            color: #0b2b40;
        }

        /* flash sale special */
        .flash-deal {
            background: linear-gradient(115deg, #ffffff 0%, #f8fafc 100%);
            border-radius: 44px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 24px;
            padding: 20px;
            box-shadow: 0 25px 40px -20px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(59, 201, 219, 0.4);
        }

        .flash-img {
            flex: 1.2;
            border-radius: 32px;
            overflow: hidden;
        }

        .flash-img img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            display: block;
        }

        .flash-content {
            flex: 1;
            padding: 12px;
        }

        .timer-group {
            display: flex;
            gap: 16px;
            margin: 24px 0;
        }

        .time-chip {
            background: #0b2b40;
            color: white;
            border-radius: 20px;
            padding: 12px 16px;
            text-align: center;
            min-width: 70px;
            backdrop-filter: blur(2px);
        }

        .time-chip span {
            font-size: 1.6rem;
            font-weight: 800;
            display: block;
        }

        /* testimonials scroll */
        .testimonials-scroll {
            display: flex;
            gap: 24px;
            overflow-x: auto;
            padding-bottom: 12px;
            scrollbar-width: thin;
        }

        .testimonial-card {
            min-width: 300px;
            background: white;
            border-radius: 28px;
            padding: 22px;
            box-shadow: var(--card-shadow);
        }

        /* newsletter */
        .newsletter-modern {
            background: radial-gradient(circle at 10% 30%, #0f2f3a, #05212b);
            border-radius: 44px;
            padding: 48px 32px;
            text-align: center;
            color: white;
        }

        .newsletter-modern input {
            padding: 14px 24px;
            border-radius: 60px;
            border: none;
            width: 280px;
            max-width: 70%;
            margin-right: 12px;
            outline: none;
        }

        footer {
            margin-top: 40px;
            padding: 48px 0 32px;
            border-top: 1px solid #e2e8f0;
        }

        @media (max-width: 860px) {
            nav.main-nav {
                display: none;
            }

            .mobile-toggle {
                display: block;
            }

            .search input {
                width: 140px;
            }

            .hero h1 {
                font-size: 2.2rem;
            }
        }

        @media (max-width: 640px) {
            .container {
                padding: 0 20px;
            }

            .flash-deal {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>

<header>
    <div class="container header-inner">
        <div style="display: flex; align-items: center; gap: 16px;">
            <button class="mobile-toggle" id="mobileMenuToggle"><i class="fas fa-bars"></i></button>
            <div class="brand"><i class="fas fa-gem"></i> NEXUS<span style="color:#3bc9db;">SHOP</span></div>
        </div>
        <nav class="main-nav">
            <ul>
                <li><a href="#"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="#categories"><i class="fas fa-compass"></i> Explore</a></li>
                <li><a href="#deals"><i class="fas fa-bolt"></i> Flash Sale</a></li>
                <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
            </ul>
        </nav>
        <div style="display: flex; gap: 16px; align-items: center;">
            <div class="search">
                <i class="fas fa-search"></i>
                <input type="text" id="globalSearch" placeholder="Search items...">
            </div>
            <div class="header-actions">
                <i class="far fa-heart" style="font-size: 1.3rem; cursor: pointer;"></i>
                <div class="cart" id="cartIcon">
                    <i class="fas fa-bag-shopping"></i>
                    <span class="cart-count" id="cartCounter">0</span>
                </div>
            </div>
        </div>
    </div>
    <!-- mobile nav drawer -->
    <div id="mobileNavDrawer" style="display: none; background: white; border-top: 1px solid #eef2ff; padding: 16px 20px;">
        <ul style="list-style: none; display: flex; flex-direction: column; gap: 16px;">
            <li><a href="#">Home</a></li>
            <li><a href="#categories">Categories</a></li>
            <li><a href="#deals">Deals</a></li>
            <li><a href="#products">Products</a></li>
        </ul>
    </div>
</header>

<main>
    <!-- Hero section fresh -->
    <div class="container">
        <div class="hero">
            <h1>Beyond the ordinary <br> <span style="color: #a5f3fc;">⚡ flash drops</span></h1>
            <p>Curated electronics, fashion & lifestyle — up to 40% off. Free express shipping on orders over $99.</p>
            <div class="btn-group">
                <button class="btn btn-primary" id="shopNowBtn"><i class="fas fa-store"></i> Shop now</button>
                <button class="btn btn-outline-light" id="scrollDealsBtn"><i class="fas fa-clock"></i> Flash deals</button>
            </div>
        </div>
    </div>

    <!-- Categories dynamic -->
    <section id="categories" class="section container">
        <div class="section-header">
            <h2><i class="fas fa-th-large"></i> Browse inspiration</h2>
            <p>Handpicked collections for every vibe</p>
        </div>
        <div class="categories-grid" id="categoriesContainer"></div>
    </section>

    <!-- Products grid -->
    <section id="products" class="section container">
        <div class="section-header">
            <h2>✨ Hottest picks right now</h2>
            <p>Based on trending & community favorites</p>
        </div>
        <div class="products-grid" id="productsContainer"></div>
    </section>

    <!-- Flash sale with countdown -->
    <section id="deals" class="section container">
        <div class="section-header">
            <h2><i class="fas fa-stopwatch"></i> Limited time obsession</h2>
            <p>Grab before it's gone</p>
        </div>
        <div class="flash-deal">
            <div class="flash-img">
                <img src="https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=600&auto=format" alt="Noise cancelling headphones">
            </div>
            <div class="flash-content">
                <h2 style="font-size: 2rem;">Sony WH-1000XM6</h2>
                <p style="color:#2d4a5c;">Industry-leading noise cancellation, 40h battery life.</p>
                <div class="price-wrap">
                    <span class="current-price" style="font-size: 2rem;">$279</span>
                    <span class="old-price">$449</span>
                    <span style="background:#ff4757; padding: 4px 12px; border-radius: 40px; color:white; font-weight: bold;">-38%</span>
                </div>
                <div class="timer-group" id="countdownTimer">
                    <div class="time-chip"><span id="days">00</span>Days</div>
                    <div class="time-chip"><span id="hours">00</span>Hrs</div>
                    <div class="time-chip"><span id="minutes">00</span>Min</div>
                    <div class="time-chip"><span id="seconds">00</span>Sec</div>
                </div>
                <button class="add-cart-btn" id="flashDealBtn" style="width: auto; padding: 12px 32px;"><i class="fas fa-bolt"></i> Add to cart - flash price</button>
            </div>
        </div>
    </section>

    <!-- Testimonials -->
    <section class="section container">
        <div class="section-header">
            <h2>❤️ Loved by 10k+ shoppers</h2>
        </div>
        <div class="testimonials-scroll">
            <div class="testimonial-card"><i class="fas fa-star" style="color:#fbbf24;"></i><i class="fas fa-star" style="color:#fbbf24;"></i><i class="fas fa-star" style="color:#fbbf24;"></i><i class="fas fa-star" style="color:#fbbf24;"></i><i class="fas fa-star" style="color:#fbbf24;"></i><p style="margin: 12px 0;">"Absolutely stunning quality, delivery was fast!"</p><b>- Elena K.</b></div>
            <div class="testimonial-card"><i class="fas fa-star" style="color:#fbbf24;"></i><i class="fas fa-star" style="color:#fbbf24;"></i><i class="fas fa-star" style="color:#fbbf24;"></i><i class="fas fa-star" style="color:#fbbf24;"></i><i class="fas fa-star-half-alt" style="color:#fbbf24;"></i><p>"Best customer service & sleek packaging."</p><b>- Marcus R.</b></div>
            <div class="testimonial-card"><i class="fas fa-star" style="color:#fbbf24;"></i><i class="fas fa-star" style="color:#fbbf24;"></i><i class="fas fa-star" style="color:#fbbf24;"></i><i class="fas fa-star" style="color:#fbbf24;"></i><i class="fas fa-star" style="color:#fbbf24;"></i><p>"The flash sale was insane! Got my dream headphones"</p><b>- Sophie L.</b></div>
        </div>
    </section>

    <!-- Newsletter -->
    <div class="container section">
        <div class="newsletter-modern">
            <h3><i class="fas fa-envelope-open-text"></i> Don't miss exclusive drops</h3>
            <p style="margin: 8px 0 24px;">Subscribe for early access & members-only perks</p>
            <form id="newsletterFormAction">
                <input type="email" id="newsEmail" placeholder="Your email address" required>
                <button class="btn btn-primary" style="background: white; color:#0b2b40;" type="submit">Subscribe →</button>
            </form>
            <div id="newsMsg" style="margin-top: 16px; font-size: 0.85rem;"></div>
        </div>
    </div>
</main>

<footer>
    <div class="container" style="display: flex; flex-wrap: wrap; justify-content: space-between; gap: 32px;">
        <div><i class="fas fa-crown"></i> <strong>NEXUSSHOP</strong><br>© 2026 premium concept</div>
        <div><span>Help</span><br>Contact<br>Returns</div>
        <div><span>Social</span><br>Instagram<br>Twitter</div>
    </div>
</footer>

<script>
    // ---------- DATA MODELS ----------
    const categoriesData = [
        { name: "Smartphones", icon: "fas fa-mobile-alt", tag: "smartphone" },
        { name: "Laptops", icon: "fas fa-laptop-code", tag: "laptop" },
        { name: "Audio", icon: "fas fa-headphones", tag: "audio" },
        { name: "Wearables", icon: "fas fa-clock", tag: "wearable" },
        { name: "Fashion", icon: "fas fa-tshirt", tag: "fashion" },
        { name: "Gaming", icon: "fas fa-gamepad", tag: "gaming" }
    ];

    const productsData = [
        { id: 1, name: "iPhone 15 Pro", price: 1099, oldPrice: 1299, rating: 5, img: "https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=300&auto=format", category: "smartphone", badge: "new" },
        { id: 2, name: "MacBook Air M3", price: 1249, oldPrice: 1399, rating: 5, img: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=300&auto=format", category: "laptop" },
        { id: 3, name: "AirPods Pro 2", price: 199, oldPrice: 249, rating: 4, img: "https://images.unsplash.com/photo-1605464315542-bda3e2f4e605?w=300&auto=format", category: "audio" },
        { id: 4, name: "Galaxy Watch6", price: 279, oldPrice: 329, rating: 4, img: "https://images.unsplash.com/photo-1579586337278-3befd40fd17a?w=300&auto=format", category: "wearable" },
        { id: 5, name: "Urban Sneakers", price: 89, oldPrice: 129, rating: 5, img: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&auto=format", category: "fashion" },
        { id: 6, name: "PS5 Controller", price: 69, oldPrice: 79, rating: 5, img: "https://images.unsplash.com/photo-1606144042614-b2417e99c4e3?w=300&auto=format", category: "gaming" }
    ];

    let cartItemCount = 0;
    const cartCounterSpan = document.getElementById('cartCounter');
    function updateCartUI() { cartCounterSpan.innerText = cartItemCount; }

    function addToCartHandler(productName) {
        cartItemCount++;
        updateCartUI();
        const toastMsg = document.createElement('div');
        toastMsg.innerText = `✨ ${productName} added to bag`;
        toastMsg.style.position = 'fixed'; toastMsg.style.bottom = '20px'; toastMsg.style.right = '20px';
        toastMsg.style.background = '#0b2b40'; toastMsg.style.color = 'white'; toastMsg.style.padding = '12px 20px';
        toastMsg.style.borderRadius = '40px'; toastMsg.style.zIndex = '999'; toastMsg.style.fontWeight = '500';
        document.body.appendChild(toastMsg);
        setTimeout(() => toastMsg.remove(), 2000);
    }

    // Render categories
    function renderCategories() {
        const container = document.getElementById('categoriesContainer');
        container.innerHTML = categoriesData.map(cat => `
            <div class="cat-card" data-category="${cat.tag}">
                <i class="${cat.icon}"></i>
                <h4>${cat.name}</h4>
                <span style="font-size:12px; color:#5f7f9e;">shop now →</span>
            </div>
        `).join('');
        document.querySelectorAll('.cat-card').forEach(el => {
            el.addEventListener('click', () => {
                const tag = el.dataset.category;
                filterProductsByCategory(tag);
            });
        });
    }

    function filterProductsByCategory(catTag) {
        const filtered = productsData.filter(p => p.category === catTag);
        renderProducts(filtered);
        document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
    }

    function renderProducts(productsArray = productsData) {
        const container = document.getElementById('productsContainer');
        container.innerHTML = productsArray.map(p => `
            <div class="product-card">
                <img class="product-img" src="${p.img}" alt="${p.name}" loading="lazy">
                <div class="product-info">
                    <div class="product-title">${p.name}</div>
                    <div class="rating">${'★'.repeat(p.rating)}${'☆'.repeat(5-p.rating)}</div>
                    <div class="price-wrap">
                        <span class="current-price">$${p.price}</span>
                        ${p.oldPrice ? `<span class="old-price">$${p.oldPrice}</span>` : ''}
                    </div>
                    <button class="add-cart-btn" data-id="${p.id}" data-name="${p.name}"><i class="fas fa-shopping-cart"></i> Add to cart</button>
                </div>
            </div>
        `).join('');
        document.querySelectorAll('.add-cart-btn').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const name = btn.dataset.name;
                addToCartHandler(name);
            });
        });
    }

    // global search functionality
    const searchInput = document.getElementById('globalSearch');
    function searchProducts() {
        const query = searchInput.value.trim().toLowerCase();
        if (!query) { renderProducts(productsData); return; }
        const filtered = productsData.filter(p => p.name.toLowerCase().includes(query) || p.category.toLowerCase().includes(query));
        renderProducts(filtered);
    }
    searchInput.addEventListener('input', searchProducts);
    document.getElementById('shopNowBtn').addEventListener('click', () => document.getElementById('products').scrollIntoView({ behavior: 'smooth' }));
    document.getElementById('scrollDealsBtn').addEventListener('click', () => document.getElementById('deals').scrollIntoView({ behavior: 'smooth' }));

    // countdown timer for flash deal (ends in 2 days)
    function startFlashCountdown() {
        const targetDate = new Date();
        targetDate.setDate(targetDate.getDate() + 1);
        targetDate.setHours(targetDate.getHours() + 18, 0, 0, 0);
        function update() {
            const now = new Date();
            const diff = targetDate - now;
            if (diff <= 0) {
                document.getElementById('days').innerText = '00'; document.getElementById('hours').innerText = '00';
                document.getElementById('minutes').innerText = '00'; document.getElementById('seconds').innerText = '00';
                return;
            }
            const days = Math.floor(diff / (1000 * 60 * 60 * 24));
            const hrs = Math.floor((diff % (86400000)) / 3600000);
            const mins = Math.floor((diff % 3600000) / 60000);
            const secs = Math.floor((diff % 60000) / 1000);
            document.getElementById('days').innerText = days < 10 ? '0'+days : days;
            document.getElementById('hours').innerText = hrs < 10 ? '0'+hrs : hrs;
            document.getElementById('minutes').innerText = mins < 10 ? '0'+mins : mins;
            document.getElementById('seconds').innerText = secs < 10 ? '0'+secs : secs;
        }
        update();
        setInterval(update, 1000);
    }
    startFlashCountdown();

    document.getElementById('flashDealBtn').addEventListener('click', () => {
        addToCartHandler("Sony WH-1000XM6 (Flash Sale)");
    });

    // mobile drawer
    const mobileToggle = document.getElementById('mobileMenuToggle');
    const drawer = document.getElementById('mobileNavDrawer');
    mobileToggle.addEventListener('click', () => {
        drawer.style.display = drawer.style.display === 'none' ? 'block' : 'none';
    });

    // newsletter
    document.getElementById('newsletterFormAction').addEventListener('submit', (e) => {
        e.preventDefault();
        const email = document.getElementById('newsEmail').value.trim();
        const msgDiv = document.getElementById('newsMsg');
        if (!email.includes('@')) {
            msgDiv.innerHTML = '<span style="color:#ffb347;">Valid email required</span>';
            return;
        }
        msgDiv.innerHTML = '<span style="color:#b9f6ca;">🎉 You\'re in! Exclusive deals ahead.</span>';
        document.getElementById('newsEmail').value = '';
        setTimeout(() => msgDiv.innerHTML = '', 3000);
    });

    // initial renders
    renderCategories();
    renderProducts(productsData);
    updateCartUI();

    // small extra: cart icon interaction
    document.getElementById('cartIcon').addEventListener('click', () => {
        alert(`Your cart has ${cartItemCount} item(s). Checkout demo.`);
    });
</script>
</body>
</html>
