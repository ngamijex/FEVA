/* ================================================================
   FEVA ADVANCED JAVASCRIPT ANIMATIONS & INTERACTIONS
   Sophisticated animations for innovative tech company website
   ================================================================ */

// Global variables for animations and interactions
let scene, camera, renderer, particles, mouse, raycaster;
let isScrolling = false;
let scrollTimeout;
let navbarScrolled = false;

// Initialize everything when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    initializeApp();
});

// Main initialization function
function initializeApp() {
    console.log('🚀 Initializing Feva Advanced Animations...');
    
    // Initialize core systems
    initializeThreeJS();
    initializeScrollAnimations();
    initializeNavigation();
    initializeParticleSystem();
    initializeAdvancedInteractions();
    initializeGSAPAnimations();
    
    // Hide loading screen
    setTimeout(() => {
        hideLoadingScreen();
    }, 2000);
    
    console.log('✨ Feva app initialized successfully!');
}

/* ================================================================
   THREE.JS BACKGROUND ANIMATION
   ================================================================ */

function initializeThreeJS() {
    const canvas = document.getElementById('canvas-container');
    if (!canvas) return;
    
    // Scene setup
    scene = new THREE.Scene();
    camera = new THREE.PerspectiveCamera(75, canvas.offsetWidth / canvas.offsetHeight, 0.1, 1000);
    renderer = new THREE.WebGLRenderer({ 
        alpha: true, 
        antialias: true,
        powerPreference: "high-performance"
    });
    
    renderer.setSize(canvas.offsetWidth, canvas.offsetHeight);
    renderer.setClearColor(0x000000, 0);
    canvas.appendChild(renderer.domElement);
    
    // Create animated geometric shapes
    createFloatingGeometry();
    
    // Animation loop
    animate3D();
    
    // Handle resize
    window.addEventListener('resize', onWindowResize);
    
    // Mouse interaction
    mouse = new THREE.Vector2();
    raycaster = new THREE.Raycaster();
    canvas.addEventListener('mousemove', onMouseMove);
}

function createFloatingGeometry() {
    const geometries = [
        new THREE.BoxGeometry(1, 1, 1),
        new THREE.SphereGeometry(0.7, 8, 6),
        new THREE.ConeGeometry(0.6, 1.2, 8),
        new THREE.OctahedronGeometry(0.8),
        new THREE.TetrahedronGeometry(0.9)
    ];
    
    const material = new THREE.MeshBasicMaterial({ 
        color: 0x08a006,
        wireframe: true,
        transparent: true,
        opacity: 0.3
    });
    
    // Create multiple floating objects
    for (let i = 0; i < 15; i++) {
        const geometry = geometries[Math.floor(Math.random() * geometries.length)];
        const mesh = new THREE.Mesh(geometry, material.clone());
        
        // Random positioning
        mesh.position.x = (Math.random() - 0.5) * 20;
        mesh.position.y = (Math.random() - 0.5) * 20;
        mesh.position.z = (Math.random() - 0.5) * 20;
        
        // Random rotation
        mesh.rotation.x = Math.random() * Math.PI;
        mesh.rotation.y = Math.random() * Math.PI;
        mesh.rotation.z = Math.random() * Math.PI;
        
        // Store initial position for animation
        mesh.userData = {
            initialPosition: mesh.position.clone(),
            rotationSpeed: {
                x: (Math.random() - 0.5) * 0.02,
                y: (Math.random() - 0.5) * 0.02,
                z: (Math.random() - 0.5) * 0.02
            },
            floatSpeed: Math.random() * 0.02 + 0.01,
            floatRange: Math.random() * 2 + 1
        };
        
        scene.add(mesh);
    }
    
    camera.position.z = 15;
}

function animate3D() {
    requestAnimationFrame(animate3D);
    
    const time = Date.now() * 0.001;
    
    // Animate each mesh
    scene.children.forEach((mesh) => {
        if (mesh.userData) {
            // Floating animation
            mesh.position.y = mesh.userData.initialPosition.y + 
                Math.sin(time * mesh.userData.floatSpeed) * mesh.userData.floatRange;
            
            // Rotation animation
            mesh.rotation.x += mesh.userData.rotationSpeed.x;
            mesh.rotation.y += mesh.userData.rotationSpeed.y;
            mesh.rotation.z += mesh.userData.rotationSpeed.z;
            
            // Subtle scale pulsing
            const scale = 1 + Math.sin(time * 2 + mesh.position.x) * 0.1;
            mesh.scale.setScalar(scale);
        }
    });
    
    // Camera gentle movement
    camera.position.x = Math.sin(time * 0.5) * 2;
    camera.position.y = Math.cos(time * 0.3) * 1;
    camera.lookAt(scene.position);
    
    renderer.render(scene, camera);
}

function onWindowResize() {
    const canvas = document.getElementById('canvas-container');
    if (!canvas || !camera || !renderer) return;
    
    camera.aspect = canvas.offsetWidth / canvas.offsetHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(canvas.offsetWidth, canvas.offsetHeight);
}

function onMouseMove(event) {
    const canvas = document.getElementById('canvas-container');
    if (!canvas) return;
    
    const rect = canvas.getBoundingClientRect();
    mouse.x = ((event.clientX - rect.left) / canvas.offsetWidth) * 2 - 1;
    mouse.y = -((event.clientY - rect.top) / canvas.offsetHeight) * 2 + 1;
    
    // Interactive camera movement
    camera.position.x += (mouse.x * 3 - camera.position.x) * 0.05;
    camera.position.y += (mouse.y * 3 - camera.position.y) * 0.05;
}

/* ================================================================
   GSAP ADVANCED ANIMATIONS
   ================================================================ */

function initializeGSAPAnimations() {
    // Register GSAP plugins if available
    if (typeof gsap !== 'undefined') {
        
        // Hero text animation sequence
        const heroTimeline = gsap.timeline({ delay: 0.5 });
        
        heroTimeline
            .from('.hero-title', {
                duration: 1.2,
                y: 100,
                opacity: 0,
                ease: "power3.out"
            })
            .from('.hero-subtitle', {
                duration: 1,
                y: 50,
                opacity: 0,
                ease: "power2.out"
            }, "-=0.8")
            .from('.hero-stats .stat-item', {
                duration: 0.8,
                y: 30,
                opacity: 0,
                stagger: 0.2,
                ease: "back.out(1.7)"
            }, "-=0.5")
            .from('.hero-actions .btn', {
                duration: 0.6,
                scale: 0.8,
                opacity: 0,
                stagger: 0.1,
                ease: "elastic.out(1, 0.5)"
            }, "-=0.3");
        
        // Navbar animation on scroll
        gsap.set('.navbar-container', { y: -100 });
        gsap.to('.navbar-container', {
            duration: 1,
            y: 0,
            ease: "power3.out",
            delay: 0.2
        });
        
        // Service cards hover animations
        document.querySelectorAll('.service-card').forEach(card => {
            card.addEventListener('mouseenter', () => {
                gsap.to(card, {
                    duration: 0.3,
                    scale: 1.05,
                    rotationY: 5,
                    z: 50,
                    ease: "power2.out"
                });
            });
            
            card.addEventListener('mouseleave', () => {
                gsap.to(card, {
                    duration: 0.3,
                    scale: 1,
                    rotationY: 0,
                    z: 0,
                    ease: "power2.out"
                });
            });
        });
        
        // Product cards animation
        gsap.from('.product-card', {
            duration: 1,
            y: 100,
            opacity: 0,
            stagger: 0.2,
            ease: "power3.out",
            scrollTrigger: {
                trigger: '.products-section',
                start: 'top 80%',
                toggleActions: 'play none none reverse'
            }
        });
        
        // Metrics counter animation
        animateCounters();
    }
}

function animateCounters() {
    const counters = document.querySelectorAll('.stat-number');
    
    counters.forEach(counter => {
        const target = parseInt(counter.textContent);
        const duration = 2;
        
        gsap.fromTo(counter, {
            textContent: 0
        }, {
            textContent: target,
            duration: duration,
            ease: "power2.out",
            snap: { textContent: 1 },
            scrollTrigger: {
                trigger: counter,
                start: 'top 80%',
                toggleActions: 'play none none reverse'
            },
            onUpdate: function() {
                counter.textContent = Math.ceil(counter.textContent) + (target === 100 ? '%' : '+');
            }
        });
    });
}

/* ================================================================
   PARTICLE SYSTEM
   ================================================================ */

function initializeParticleSystem() {
    createFloatingParticles();
    createInteractiveParticles();
}

function createFloatingParticles() {
    const particleContainer = document.createElement('div');
    particleContainer.className = 'particle-container';
    particleContainer.style.cssText = `
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        pointer-events: none;
        z-index: 1;
        overflow: hidden;
    `;
    
    document.body.appendChild(particleContainer);
    
    // Create floating particles
    for (let i = 0; i < 50; i++) {
        createParticle(particleContainer);
    }
}

function createParticle(container) {
    const particle = document.createElement('div');
    particle.className = 'floating-particle';
    
    const size = Math.random() * 4 + 1;
    const x = Math.random() * window.innerWidth;
    const y = Math.random() * window.innerHeight;
    const duration = Math.random() * 20 + 10;
    const delay = Math.random() * 5;
    
    particle.style.cssText = `
        position: absolute;
        width: ${size}px;
        height: ${size}px;
        background: rgba(8, 160, 6, ${Math.random() * 0.5 + 0.1});
        border-radius: 50%;
        left: ${x}px;
        top: ${y}px;
        animation: floatParticle ${duration}s ${delay}s infinite linear;
    `;
    
    container.appendChild(particle);
    
    // Remove and recreate particle after animation
    setTimeout(() => {
        if (particle.parentNode) {
            particle.parentNode.removeChild(particle);
            createParticle(container);
        }
    }, (duration + delay) * 1000);
}

function createInteractiveParticles() {
    const style = document.createElement('style');
    style.textContent = `
        @keyframes floatParticle {
            0% {
                transform: translateY(100vh) translateX(0) rotate(0deg);
                opacity: 0;
            }
            10% {
                opacity: 1;
            }
            90% {
                opacity: 1;
            }
            100% {
                transform: translateY(-100px) translateX(${Math.random() * 200 - 100}px) rotate(360deg);
                opacity: 0;
            }
        }
        
        .floating-particle:hover {
            transform: scale(3) !important;
            background: rgba(8, 160, 6, 0.8) !important;
            transition: all 0.3s ease;
        }
    `;
    document.head.appendChild(style);
}

/* ================================================================
   SCROLL ANIMATIONS & PARALLAX
   ================================================================ */

function initializeScrollAnimations() {
    // Initialize AOS if available
    if (typeof AOS !== 'undefined') {
        AOS.init({
            duration: 1000,
            easing: 'ease-out-cubic',
            once: false,
            mirror: true,
            offset: 100
        });
    }
    
    // Custom scroll effects
    window.addEventListener('scroll', handleScroll);
    window.addEventListener('scroll', updateNavbar);
    
    // Parallax effects
    initializeParallax();
}

function handleScroll() {
    isScrolling = true;
    
    clearTimeout(scrollTimeout);
    scrollTimeout = setTimeout(() => {
        isScrolling = false;
    }, 150);
    
    // Get scroll position
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    const windowHeight = window.innerHeight;
    const documentHeight = document.documentElement.scrollHeight;
    
    // Update scroll-based animations
    updateScrollAnimations(scrollTop, windowHeight);
    
    // Progress indicator
    updateScrollProgress(scrollTop, documentHeight, windowHeight);
}

function updateScrollAnimations(scrollTop, windowHeight) {
    // Hero parallax effect
    const heroSection = document.querySelector('.hero-section');
    if (heroSection) {
        const heroOffset = scrollTop * 0.3;
        heroSection.style.transform = `translateY(${heroOffset}px)`;
    }
    
    // Background color transition
    const aboutSection = document.querySelector('.about-section');
    if (aboutSection) {
        const aboutTop = aboutSection.offsetTop;
        const aboutHeight = aboutSection.offsetHeight;
        
        if (scrollTop >= aboutTop - windowHeight && scrollTop <= aboutTop + aboutHeight) {
            const progress = (scrollTop - (aboutTop - windowHeight)) / (windowHeight + aboutHeight);
            document.body.style.backgroundColor = `rgba(250, 250, 250, ${progress * 0.5})`;
        }
    }
}

function updateScrollProgress(scrollTop, documentHeight, windowHeight) {
    const progress = scrollTop / (documentHeight - windowHeight);
    const progressBar = document.querySelector('.scroll-progress');
    
    if (!progressBar) {
        createScrollProgressBar();
        return;
    }
    
    progressBar.style.width = `${progress * 100}%`;
}

function createScrollProgressBar() {
    const progressBar = document.createElement('div');
    progressBar.className = 'scroll-progress';
    progressBar.style.cssText = `
        position: fixed;
        top: 0;
        left: 0;
        width: 0%;
        height: 3px;
        background: linear-gradient(90deg, #08a006, #0bc208);
        z-index: 9999;
        transition: width 0.1s ease;
    `;
    document.body.appendChild(progressBar);
}

function initializeParallax() {
    const parallaxElements = document.querySelectorAll('[data-parallax]');
    
    parallaxElements.forEach(element => {
        const speed = parseFloat(element.dataset.parallax) || 0.5;
        
        window.addEventListener('scroll', () => {
            const scrollTop = window.pageYOffset;
            const rate = scrollTop * -speed;
            element.style.transform = `translateY(${rate}px)`;
        });
    });
}

/* ================================================================
   NAVIGATION INTERACTIONS
   ================================================================ */

function initializeNavigation() {
    const navbar = document.querySelector('.navbar-container');
    const navItems = document.querySelectorAll('.nav-item');
    const mobileToggle = document.querySelector('.mobile-menu-toggle');
    const navMenu = document.querySelector('.nav-menu');
    
    // Smooth scrolling for navigation
    navItems.forEach(item => {
        item.addEventListener('click', (e) => {
            e.preventDefault();
            const target = item.dataset.target;
            smoothScrollTo(target);
            setActiveNavItem(item);
        });
    });
    
    // Mobile menu toggle
    if (mobileToggle) {
        mobileToggle.addEventListener('click', () => {
            mobileToggle.classList.toggle('active');
            navMenu.classList.toggle('mobile-active');
        });
    }
    
    // Logo click to top
    const logo = document.querySelector('.brand-logo');
    if (logo) {
        logo.addEventListener('click', () => {
            smoothScrollTo('hero');
        });
    }
}

function updateNavbar() {
    const navbar = document.querySelector('.navbar-container');
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    
    if (scrollTop > 100 && !navbarScrolled) {
        navbar.classList.add('scrolled');
        navbarScrolled = true;
    } else if (scrollTop <= 100 && navbarScrolled) {
        navbar.classList.remove('scrolled');
        navbarScrolled = false;
    }
}

function setActiveNavItem(activeItem) {
    document.querySelectorAll('.nav-item').forEach(item => {
        item.classList.remove('active');
    });
    activeItem.classList.add('active');
}

/* ================================================================
   ADVANCED INTERACTIONS
   ================================================================ */

function initializeAdvancedInteractions() {
    initializeHoverEffects();
    initializeMagneticButtons();
    initializeTypewriterEffect();
    initializeIntersectionObserver();
    initializeAdvancedForms();
}

function initializeHoverEffects() {
    // Card tilt effect
    document.querySelectorAll('.about-card, .service-card, .product-card').forEach(card => {
        card.addEventListener('mousemove', handleCardTilt);
        card.addEventListener('mouseleave', resetCardTilt);
    });
    
    // Button ripple effect
    document.querySelectorAll('.btn').forEach(button => {
        button.addEventListener('click', createRippleEffect);
    });
}

function handleCardTilt(e) {
    const card = e.currentTarget;
    const rect = card.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;
    
    const centerX = rect.width / 2;
    const centerY = rect.height / 2;
    
    const rotateX = (y - centerY) / 10;
    const rotateY = (centerX - x) / 10;
    
    card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale3d(1.05, 1.05, 1.05)`;
}

function resetCardTilt(e) {
    const card = e.currentTarget;
    card.style.transform = 'perspective(1000px) rotateX(0) rotateY(0) scale3d(1, 1, 1)';
}

function createRippleEffect(e) {
    const button = e.currentTarget;
    const rect = button.getBoundingClientRect();
    const ripple = document.createElement('span');
    const size = Math.max(rect.width, rect.height);
    const x = e.clientX - rect.left - size / 2;
    const y = e.clientY - rect.top - size / 2;
    
    ripple.style.cssText = `
        position: absolute;
        width: ${size}px;
        height: ${size}px;
        left: ${x}px;
        top: ${y}px;
        background: rgba(255, 255, 255, 0.3);
        border-radius: 50%;
        transform: scale(0);
        animation: ripple 0.6s ease-out;
        pointer-events: none;
    `;
    
    if (!document.querySelector('.ripple-style')) {
        const style = document.createElement('style');
        style.className = 'ripple-style';
        style.textContent = `
            @keyframes ripple {
                to {
                    transform: scale(2);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    }
    
    button.style.position = 'relative';
    button.style.overflow = 'hidden';
    button.appendChild(ripple);
    
    setTimeout(() => {
        ripple.remove();
    }, 600);
}

function initializeMagneticButtons() {
    document.querySelectorAll('.btn-primary').forEach(button => {
        button.addEventListener('mousemove', (e) => {
            const rect = button.getBoundingClientRect();
            const x = e.clientX - rect.left - rect.width / 2;
            const y = e.clientY - rect.top - rect.height / 2;
            
            button.style.transform = `translate(${x * 0.1}px, ${y * 0.1}px)`;
        });
        
        button.addEventListener('mouseleave', () => {
            button.style.transform = 'translate(0, 0)';
        });
    });
}

function initializeTypewriterEffect() {
    const typewriterElements = document.querySelectorAll('[data-typewriter]');
    
    typewriterElements.forEach(element => {
        const text = element.textContent;
        element.textContent = '';
        
        let i = 0;
        const timer = setInterval(() => {
            element.textContent += text.charAt(i);
            i++;
            
            if (i > text.length) {
                clearInterval(timer);
            }
        }, 100);
    });
}

function initializeIntersectionObserver() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-fade-in');
                
                // Trigger specific animations based on element
                if (entry.target.classList.contains('metric-card')) {
                    animateMetricCard(entry.target);
                }
                
                if (entry.target.classList.contains('service-card')) {
                    animateServiceCard(entry.target);
                }
            }
        });
    }, observerOptions);
    
    // Observe elements
    document.querySelectorAll('.metric-card, .service-card, .about-card').forEach(el => {
        observer.observe(el);
    });
}

function animateMetricCard(card) {
    const value = card.querySelector('.metric-value');
    if (value) {
        const finalValue = parseInt(value.textContent);
        animateNumber(value, 0, finalValue, 2000);
    }
}

function animateServiceCard(card) {
    const items = card.querySelectorAll('li');
    items.forEach((item, index) => {
        setTimeout(() => {
            item.style.opacity = '1';
            item.style.transform = 'translateX(0)';
        }, index * 200);
    });
}

function initializeAdvancedForms() {
    // Floating labels
    document.querySelectorAll('.form-control').forEach(input => {
        const label = input.previousElementSibling;
        if (label && label.tagName === 'LABEL') {
            
            input.addEventListener('focus', () => {
                label.style.transform = 'translateY(-150%) scale(0.85)';
                label.style.color = '#08a006';
            });
            
            input.addEventListener('blur', () => {
                if (!input.value) {
                    label.style.transform = 'translateY(0) scale(1)';
                    label.style.color = '#666';
                }
            });
        }
    });
    
    // Form validation with visual feedback
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', handleFormSubmit);
    });
}

function handleFormSubmit(e) {
    const form = e.currentTarget;
    const inputs = form.querySelectorAll('input, textarea, select');
    let isValid = true;
    
    inputs.forEach(input => {
        if (input.required && !input.value.trim()) {
            showFieldError(input, 'This field is required');
            isValid = false;
        } else {
            clearFieldError(input);
        }
    });
    
    if (!isValid) {
        e.preventDefault();
    }
}

function showFieldError(field, message) {
    clearFieldError(field);
    
    field.style.borderColor = '#dc2626';
    field.style.boxShadow = '0 0 0 3px rgba(220, 38, 38, 0.1)';
    
    const error = document.createElement('div');
    error.className = 'field-error';
    error.textContent = message;
    error.style.cssText = `
        color: #dc2626;
        font-size: 0.875rem;
        margin-top: 0.25rem;
        animation: slideDown 0.3s ease;
    `;
    
    field.parentNode.appendChild(error);
}

function clearFieldError(field) {
    field.style.borderColor = '';
    field.style.boxShadow = '';
    
    const existingError = field.parentNode.querySelector('.field-error');
    if (existingError) {
        existingError.remove();
    }
}

/* ================================================================
   UTILITY FUNCTIONS
   ================================================================ */

function smoothScrollTo(target) {
    const element = document.getElementById(target);
    if (element) {
        const headerHeight = document.querySelector('.navbar-container').offsetHeight;
        const targetPosition = element.offsetTop - headerHeight;
        
        window.scrollTo({
            top: targetPosition,
            behavior: 'smooth'
        });
    }
}

function animateNumber(element, start, end, duration) {
    const startTime = Date.now();
    const range = end - start;
    
    function updateNumber() {
        const elapsed = Date.now() - startTime;
        const progress = Math.min(elapsed / duration, 1);
        const current = Math.floor(start + (range * easeOutCubic(progress)));
        
        element.textContent = current + (end === 100 ? '%' : '+');
        
        if (progress < 1) {
            requestAnimationFrame(updateNumber);
        }
    }
    
    updateNumber();
}

function easeOutCubic(t) {
    return 1 - Math.pow(1 - t, 3);
}

function hideLoadingScreen() {
    const waiter = document.querySelector('.waiter-content');
    if (waiter) {
        waiter.style.opacity = '0';
        waiter.style.transform = 'scale(0.8)';
        setTimeout(() => {
            const waiterContainer = waiter.closest('.waiter');
            if (waiterContainer) {
                waiterContainer.style.display = 'none';
            }
        }, 500);
    }
}

/* ================================================================
   SHINY-SPECIFIC FUNCTIONS
   ================================================================ */

function triggerServiceAnimation() {
    const serviceCards = document.querySelectorAll('.service-card');
    serviceCards.forEach((card, index) => {
        setTimeout(() => {
            card.classList.add('animate-bounce');
            setTimeout(() => {
                card.classList.remove('animate-bounce');
            }, 600);
        }, index * 100);
    });
}

function triggerDemoAnimation() {
    console.log('🎥 Demo animation triggered');
    // Add demo-specific animations here
    const demoButton = event.target;
    demoButton.textContent = 'Loading Demo...';
    
    setTimeout(() => {
        demoButton.textContent = 'Watch Demo';
        showNotification('Demo will be available soon!', 'info');
    }, 2000);
}

function triggerInsightGeneration() {
    console.log('🧠 AI insights generation triggered');
    const analyticsSection = document.querySelector('.analytics-section');
    analyticsSection.classList.add('glow-effect');
    
    setTimeout(() => {
        analyticsSection.classList.remove('glow-effect');
    }, 3000);
}

function triggerFormSubmission() {
    console.log('📧 Form submission triggered');
    const form = document.querySelector('.contact-form');
    form.classList.add('animate-scale');
    
    setTimeout(() => {
        form.classList.remove('animate-scale');
    }, 300);
}

function triggerProductInterest(product) {
    console.log(`🚀 Interest registered for ${product}`);
    const productCard = document.querySelector(`#${product}-card`);
    if (productCard) {
        productCard.classList.add('pulse-animation');
        setTimeout(() => {
            productCard.classList.remove('pulse-animation');
        }, 2000);
    }
}

function showNotification(message, type = 'success') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    notification.style.cssText = `
        position: fixed;
        top: 20px;
        right: 20px;
        background: ${type === 'success' ? '#08a006' : '#3b82f6'};
        color: white;
        padding: 1rem 1.5rem;
        border-radius: 0.5rem;
        z-index: 10000;
        animation: slideInRight 0.3s ease;
    `;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.style.animation = 'slideOutRight 0.3s ease';
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, 3000);
}

// Add notification animations
const notificationStyles = document.createElement('style');
notificationStyles.textContent = `
    @keyframes slideInRight {
        from {
            transform: translateX(100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }
    
    @keyframes slideOutRight {
        from {
            transform: translateX(0);
            opacity: 1;
        }
        to {
            transform: translateX(100%);
            opacity: 0;
        }
    }
    
    @keyframes slideDown {
        from {
            transform: translateY(-10px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }
`;
document.head.appendChild(notificationStyles);

console.log('🎨 Feva Advanced JavaScript loaded successfully!');

/* ================================================================
   PERFORMANCE OPTIMIZATION
   ================================================================ */

// Debounce function for performance
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Throttle function for scroll events
function throttle(func, limit) {
    let inThrottle;
    return function() {
        const args = arguments;
        const context = this;
        if (!inThrottle) {
            func.apply(context, args);
            inThrottle = true;
            setTimeout(() => inThrottle = false, limit);
        }
    };
}

// Apply performance optimizations
window.addEventListener('scroll', throttle(handleScroll, 16));
window.addEventListener('resize', debounce(onWindowResize, 250));