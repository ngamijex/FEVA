/* ================================================================
   FEVA - PROFESSIONAL ANIMATION & INTERACTION SYSTEM
   World-class JavaScript for revolutionary user experience
   ================================================================ */

(function() {
    'use strict';

    // ===== GLOBAL VARIABLES =====
    let isLoaded = false;
    let scrollY = 0;
    let ticking = false;
    let theme = 'light';
    let mobileMenuOpen = false;
    let currentTestimonial = 0;
    let testimonialInterval;
    let particleSystem;
    let formStep = 1;

    // ===== INITIALIZATION =====
    const FevaAnimations = {
        init() {
            this.setupEventListeners();
            this.initializeScrollEffects();
            this.initializeTheme();
            this.initializeParticles();
            this.initializeAnimations();
            this.initializeIntersectionObserver();
            this.initializeTestimonials();
            this.initializePortfolioFilters();
            this.initializeFormHandlers();
            this.initializeNavigationEffects();
            this.initializePerformanceMonitoring();
            
            // Mark as loaded
            isLoaded = true;
            console.log('🚀 Feva Animations System Initialized');
        },

        // ===== EVENT LISTENERS =====
        setupEventListeners() {
            // Window events
            window.addEventListener('scroll', this.throttledScrollHandler.bind(this));
            window.addEventListener('resize', this.debounce(this.handleResize.bind(this), 250));
            window.addEventListener('load', this.handlePageLoad.bind(this));
            
            // Navigation events
            document.addEventListener('click', this.handleNavigation.bind(this));
            
            // Theme toggle
            const themeToggle = document.getElementById('theme-toggle');
            if (themeToggle) {
                themeToggle.addEventListener('click', this.toggleTheme.bind(this));
            }
            
            // Mobile menu toggle
            const mobileToggle = document.getElementById('mobile-menu-toggle');
            if (mobileToggle) {
                mobileToggle.addEventListener('click', this.toggleMobileMenu.bind(this));
            }
            
            // Back to top button
            const backToTop = document.getElementById('back-to-top');
            if (backToTop) {
                backToTop.addEventListener('click', this.scrollToTop.bind(this));
            }
            
            // Floating action button
            const fab = document.getElementById('floating-action-btn');
            if (fab) {
                fab.addEventListener('click', this.handleFabClick.bind(this));
            }
            
            // Form navigation
            this.setupFormNavigation();
            
            // Portfolio filters
            this.setupPortfolioFilters();
            
            // Service cards
            this.setupServiceCardAnimations();
        },

        // ===== SCROLL EFFECTS =====
        throttledScrollHandler() {
            scrollY = window.pageYOffset;
            
            if (!ticking) {
                requestAnimationFrame(() => {
                    this.updateScrollEffects();
                    ticking = false;
                });
                ticking = true;
            }
        },

        updateScrollEffects() {
            this.updateHeaderOnScroll();
            this.updateBackToTopButton();
            this.updateParallaxEffects();
            this.updateProgressIndicators();
        },

        updateHeaderOnScroll() {
            const header = document.getElementById('site-header');
            if (!header) return;
            
            if (scrollY > 100) {
                header.classList.add('scrolled');
                header.style.background = 'rgba(255, 255, 255, 0.95)';
                header.style.boxShadow = '0 4px 20px rgba(0, 0, 0, 0.1)';
            } else {
                header.classList.remove('scrolled');
                header.style.background = 'rgba(255, 255, 255, 0.95)';
                header.style.boxShadow = 'none';
            }
        },

        updateBackToTopButton() {
            const backToTop = document.getElementById('back-to-top');
            if (!backToTop) return;
            
            if (scrollY > 500) {
                backToTop.classList.add('visible');
            } else {
                backToTop.classList.remove('visible');
            }
        },

        updateParallaxEffects() {
            // Hero parallax
            const heroPattern = document.querySelector('.hero-pattern');
            if (heroPattern) {
                const parallaxSpeed = scrollY * 0.5;
                heroPattern.style.transform = `translateY(${parallaxSpeed}px)`;
            }
            
            // Floating icons parallax
            const floatingIcons = document.querySelectorAll('.floating-icon');
            floatingIcons.forEach((icon, index) => {
                const speed = (index + 1) * 0.2;
                const yPos = scrollY * speed;
                icon.style.transform = `translateY(${yPos}px) rotate(${yPos * 0.1}deg)`;
            });
        },

        updateProgressIndicators() {
            // Update any progress bars based on scroll position
            const sections = document.querySelectorAll('section');
            const totalHeight = document.documentElement.scrollHeight - window.innerHeight;
            const progress = (scrollY / totalHeight) * 100;
            
            // Update any progress elements
            const progressBars = document.querySelectorAll('.scroll-progress');
            progressBars.forEach(bar => {
                bar.style.width = `${progress}%`;
            });
        },

        // ===== THEME SYSTEM =====
        initializeTheme() {
            // Check for saved theme or default to light
            const savedTheme = localStorage.getItem('feva-theme') || 'light';
            this.setTheme(savedTheme);
        },

        toggleTheme() {
            theme = theme === 'light' ? 'dark' : 'light';
            this.setTheme(theme);
        },

        setTheme(newTheme) {
            theme = newTheme;
            document.documentElement.setAttribute('data-theme', theme);
            localStorage.setItem('feva-theme', theme);
            
            // Update theme icons
            const lightIcon = document.querySelector('.light-icon');
            const darkIcon = document.querySelector('.dark-icon');
            
            if (theme === 'dark') {
                if (lightIcon) lightIcon.style.opacity = '0';
                if (darkIcon) darkIcon.style.opacity = '1';
            } else {
                if (lightIcon) lightIcon.style.opacity = '1';
                if (darkIcon) darkIcon.style.opacity = '0';
            }
            
            // Animate theme transition
            document.body.style.transition = 'background-color 0.3s ease, color 0.3s ease';
            setTimeout(() => {
                document.body.style.transition = '';
            }, 300);
        },

        // ===== PARTICLE SYSTEM =====
        initializeParticles() {
            const particleContainer = document.getElementById('hero-particles');
            if (!particleContainer) return;
            
            this.createParticleSystem(particleContainer);
        },

        createParticleSystem(container) {
            const particleCount = window.innerWidth < 768 ? 30 : 50;
            
            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');
                particle.className = 'particle';
                particle.style.cssText = `
                    position: absolute;
                    width: ${Math.random() * 4 + 2}px;
                    height: ${Math.random() * 4 + 2}px;
                    background: rgba(5, 179, 5, ${Math.random() * 0.3 + 0.1});
                    border-radius: 50%;
                    pointer-events: none;
                    left: ${Math.random() * 100}%;
                    top: ${Math.random() * 100}%;
                    animation: particleFloat ${Math.random() * 20 + 10}s linear infinite;
                `;
                container.appendChild(particle);
            }
            
            // Add particle animation CSS
            this.addParticleStyles();
        },

        addParticleStyles() {
            const style = document.createElement('style');
            style.textContent = `
                @keyframes particleFloat {
                    0% {
                        transform: translateY(100vh) translateX(0);
                        opacity: 0;
                    }
                    10% {
                        opacity: 1;
                    }
                    90% {
                        opacity: 1;
                    }
                    100% {
                        transform: translateY(-100px) translateX(${Math.random() * 100 - 50}px);
                        opacity: 0;
                    }
                }
            `;
            document.head.appendChild(style);
        },

        // ===== ANIMATION SYSTEM =====
        initializeAnimations() {
            // Initialize AOS (Animate On Scroll) if available
            if (typeof AOS !== 'undefined') {
                AOS.init({
                    duration: 800,
                    easing: 'ease-out-cubic',
                    once: true,
                    offset: 50,
                    disable: window.innerWidth < 768 ? 'mobile' : false
                });
            }
            
            // Initialize GSAP animations if available
            if (typeof gsap !== 'undefined') {
                this.initializeGSAPAnimations();
            }
            
            // Fallback CSS animations
            this.initializeFallbackAnimations();
        },

        initializeGSAPAnimations() {
            // Hero title animation
            gsap.from('.hero-title', {
                duration: 1,
                y: 50,
                opacity: 0,
                ease: 'power3.out',
                delay: 0.3
            });
            
            // Hero subtitle animation
            gsap.from('.hero-subtitle', {
                duration: 1,
                y: 30,
                opacity: 0,
                ease: 'power3.out',
                delay: 0.5
            });
            
            // Hero stats animation
            gsap.from('.stat-item', {
                duration: 0.8,
                y: 30,
                opacity: 0,
                stagger: 0.1,
                ease: 'power3.out',
                delay: 0.7
            });
            
            // Floating icons animation
            gsap.set('.floating-icon', { scale: 0, rotation: 180 });
            gsap.to('.floating-icon', {
                duration: 1,
                scale: 1,
                rotation: 0,
                stagger: 0.2,
                ease: 'elastic.out(1, 0.5)',
                delay: 1
            });
        },

        initializeFallbackAnimations() {
            // If no animation library, use CSS classes
            const animatedElements = document.querySelectorAll('[data-animate]');
            
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const animationType = entry.target.dataset.animate;
                        entry.target.classList.add('animate-' + animationType);
                    }
                });
            }, { threshold: 0.1 });
            
            animatedElements.forEach(el => observer.observe(el));
        },

        // ===== INTERSECTION OBSERVER =====
        initializeIntersectionObserver() {
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -50px 0px'
            };
            
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        this.handleElementInView(entry.target);
                    }
                });
            }, observerOptions);
            
            // Observe all sections and important elements
            const elementsToObserve = document.querySelectorAll(`
                section,
                .service-card,
                .solution-card,
                .portfolio-card,
                .team-card,
                .about-card,
                .stat-item
            `);
            
            elementsToObserve.forEach(el => observer.observe(el));
        },

        handleElementInView(element) {
            // Add animation classes
            element.classList.add('in-view');
            
            // Handle counter animations
            if (element.classList.contains('stat-item')) {
                this.animateCounter(element);
            }
            
            // Handle card animations
            if (element.classList.contains('service-card') || 
                element.classList.contains('solution-card') ||
                element.classList.contains('portfolio-card')) {
                this.animateCard(element);
            }
        },

        animateCounter(element) {
            const numberElement = element.querySelector('.stat-number');
            if (!numberElement || numberElement.dataset.animated) return;
            
            const target = parseInt(numberElement.textContent.replace(/[^\d]/g, ''));
            const suffix = numberElement.textContent.replace(/[\d]/g, '');
            let current = 0;
            const increment = target / 50;
            const timer = setInterval(() => {
                current += increment;
                if (current >= target) {
                    current = target;
                    clearInterval(timer);
                }
                numberElement.textContent = Math.floor(current) + suffix;
            }, 30);
            
            numberElement.dataset.animated = 'true';
        },

        animateCard(element) {
            if (element.dataset.animated) return;
            
            element.style.transform = 'translateY(20px)';
            element.style.opacity = '0';
            
            setTimeout(() => {
                element.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
                element.style.transform = 'translateY(0)';
                element.style.opacity = '1';
            }, 100);
            
            element.dataset.animated = 'true';
        },

        // ===== TESTIMONIALS SYSTEM =====
        initializeTestimonials() {
            const testimonialCards = document.querySelectorAll('.testimonial-card');
            const dots = document.querySelectorAll('.dot');
            
            if (testimonialCards.length === 0) return;
            
            // Auto-rotate testimonials
            this.startTestimonialRotation();
            
            // Dot navigation
            dots.forEach((dot, index) => {
                dot.addEventListener('click', () => {
                    this.showTestimonial(index);
                });
            });
        },

        startTestimonialRotation() {
            testimonialInterval = setInterval(() => {
                const testimonialCards = document.querySelectorAll('.testimonial-card');
                currentTestimonial = (currentTestimonial + 1) % testimonialCards.length;
                this.showTestimonial(currentTestimonial);
            }, 5000);
        },

        showTestimonial(index) {
            const testimonialCards = document.querySelectorAll('.testimonial-card');
            const dots = document.querySelectorAll('.dot');
            
            // Hide all testimonials
            testimonialCards.forEach(card => {
                card.classList.remove('active');
            });
            
            // Remove active from all dots
            dots.forEach(dot => {
                dot.classList.remove('active');
            });
            
            // Show selected testimonial
            if (testimonialCards[index]) {
                testimonialCards[index].classList.add('active');
            }
            
            if (dots[index]) {
                dots[index].classList.add('active');
            }
            
            currentTestimonial = index;
        },

        // ===== PORTFOLIO FILTERS =====
        initializePortfolioFilters() {
            this.setupPortfolioFilters();
        },

        setupPortfolioFilters() {
            const filterButtons = document.querySelectorAll('.filter-tab');
            
            filterButtons.forEach(button => {
                button.addEventListener('click', (e) => {
                    const filter = e.target.dataset.filter || 'all';
                    this.filterPortfolioItems(filter);
                    this.updateFilterButtons(filter);
                });
            });
        },

        filterPortfolioItems(filter) {
            const portfolioItems = document.querySelectorAll('.portfolio-card');
            
            portfolioItems.forEach(item => {
                if (filter === 'all' || item.dataset.category === filter) {
                    item.style.display = 'block';
                    item.style.animation = 'fadeInUp 0.6s ease forwards';
                } else {
                    item.style.animation = 'fadeOut 0.3s ease forwards';
                    setTimeout(() => {
                        item.style.display = 'none';
                    }, 300);
                }
            });
        },

        updateFilterButtons(activeFilter) {
            const filterButtons = document.querySelectorAll('.filter-tab');
            
            filterButtons.forEach(button => {
                button.classList.remove('active');
                if (button.dataset.filter === activeFilter || 
                    (activeFilter === 'all' && !button.dataset.filter)) {
                    button.classList.add('active');
                }
            });
        },

        // ===== FORM HANDLERS =====
        initializeFormHandlers() {
            this.setupFormNavigation();
            this.setupFormValidation();
        },

        setupFormNavigation() {
            const nextButtons = document.querySelectorAll('[id^="next_step"]');
            const prevButtons = document.querySelectorAll('[id^="prev_step"]');
            
            nextButtons.forEach(button => {
                button.addEventListener('click', () => {
                    const currentStep = parseInt(button.id.split('_')[2]);
                    this.showFormStep(currentStep + 1);
                });
            });
            
            prevButtons.forEach(button => {
                button.addEventListener('click', () => {
                    const currentStep = parseInt(button.id.split('_')[2]);
                    this.showFormStep(currentStep - 1);
                });
            });
        },

        showFormStep(step) {
            const steps = document.querySelectorAll('.form-step');
            
            // Hide all steps
            steps.forEach(stepElement => {
                stepElement.classList.remove('active');
            });
            
            // Show target step
            const targetStep = document.getElementById(`step-${step}`);
            if (targetStep) {
                targetStep.classList.add('active');
                formStep = step;
                
                // Update progress bar
                this.updateFormProgress(step);
                
                // Animate step transition
                targetStep.style.opacity = '0';
                targetStep.style.transform = 'translateX(20px)';
                
                setTimeout(() => {
                    targetStep.style.transition = 'all 0.3s ease';
                    targetStep.style.opacity = '1';
                    targetStep.style.transform = 'translateX(0)';
                }, 50);
            }
        },

        updateFormProgress(step) {
            const progressBars = document.querySelectorAll('.step-progress .progress-bar');
            const progress = (step / 3) * 100;
            
            progressBars.forEach(bar => {
                bar.style.width = `${progress}%`;
            });
        },

        setupFormValidation() {
            const forms = document.querySelectorAll('form');
            
            forms.forEach(form => {
                const inputs = form.querySelectorAll('input, select, textarea');
                
                inputs.forEach(input => {
                    input.addEventListener('blur', () => {
                        this.validateField(input);
                    });
                    
                    input.addEventListener('input', () => {
                        this.clearFieldError(input);
                    });
                });
            });
        },

        validateField(field) {
            const value = field.value.trim();
            const isRequired = field.hasAttribute('required');
            const type = field.type;
            
            let isValid = true;
            let errorMessage = '';
            
            // Required field validation
            if (isRequired && !value) {
                isValid = false;
                errorMessage = 'This field is required';
            }
            
            // Email validation
            if (type === 'email' && value) {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(value)) {
                    isValid = false;
                    errorMessage = 'Please enter a valid email address';
                }
            }
            
            // Phone validation
            if (type === 'tel' && value) {
                const phoneRegex = /^[\+]?[\d\s\-\(\)]{10,}$/;
                if (!phoneRegex.test(value)) {
                    isValid = false;
                    errorMessage = 'Please enter a valid phone number';
                }
            }
            
            if (!isValid) {
                this.showFieldError(field, errorMessage);
            } else {
                this.clearFieldError(field);
            }
            
            return isValid;
        },

        showFieldError(field, message) {
            this.clearFieldError(field);
            
            field.style.borderColor = '#ef4444';
            field.style.backgroundColor = 'rgba(239, 68, 68, 0.05)';
            
            const errorElement = document.createElement('div');
            errorElement.className = 'field-error';
            errorElement.textContent = message;
            errorElement.style.cssText = `
                color: #ef4444;
                font-size: 0.875rem;
                margin-top: 0.25rem;
                animation: slideInDown 0.3s ease;
            `;
            
            field.parentNode.insertBefore(errorElement, field.nextSibling);
        },

        clearFieldError(field) {
            field.style.borderColor = '';
            field.style.backgroundColor = '';
            
            const errorElement = field.parentNode.querySelector('.field-error');
            if (errorElement) {
                errorElement.remove();
            }
        },

        // ===== NAVIGATION EFFECTS =====
        initializeNavigationEffects() {
            this.setupSmoothScrolling();
            this.setupNavigationHighlight();
        },

        setupSmoothScrolling() {
            document.addEventListener('click', (e) => {
                if (e.target.matches('a[href^="#"]')) {
                    e.preventDefault();
                    const targetId = e.target.getAttribute('href');
                    const targetElement = document.querySelector(targetId);
                    
                    if (targetElement) {
                        this.smoothScrollTo(targetElement);
                    }
                }
            });
        },

        smoothScrollTo(element) {
            const headerHeight = document.getElementById('site-header')?.offsetHeight || 80;
            const targetPosition = element.offsetTop - headerHeight;
            
            window.scrollTo({
                top: targetPosition,
                behavior: 'smooth'
            });
        },

        setupNavigationHighlight() {
            const navItems = document.querySelectorAll('.nav-item');
            const sections = document.querySelectorAll('section[id]');
            
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        this.updateActiveNavItem(entry.target.id);
                    }
                });
            }, {
                threshold: 0.3,
                rootMargin: '-80px 0px 0px 0px'
            });
            
            sections.forEach(section => observer.observe(section));
        },

        updateActiveNavItem(sectionId) {
            const navItems = document.querySelectorAll('.nav-item');
            
            navItems.forEach(item => {
                item.classList.remove('active');
                const link = item.querySelector('a');
                if (link && link.getAttribute('href') === `#${sectionId}`) {
                    item.classList.add('active');
                }
            });
        },

        // ===== SERVICE CARDS =====
        setupServiceCardAnimations() {
            const serviceCards = document.querySelectorAll('.service-card');
            
            serviceCards.forEach(card => {
                card.addEventListener('mouseenter', () => {
                    this.animateServiceCard(card, 'enter');
                });
                
                card.addEventListener('mouseleave', () => {
                    this.animateServiceCard(card, 'leave');
                });
            });
        },

        animateServiceCard(card, action) {
            const icon = card.querySelector('.service-icon');
            const image = card.querySelector('.service-img');
            
            if (action === 'enter') {
                if (icon) {
                    icon.style.transform = 'scale(1.1) rotate(5deg)';
                }
                if (image) {
                    image.style.transform = 'scale(1.05)';
                }
            } else {
                if (icon) {
                    icon.style.transform = 'scale(1) rotate(0deg)';
                }
                if (image) {
                    image.style.transform = 'scale(1)';
                }
            }
        },

        // ===== MOBILE MENU =====
        toggleMobileMenu() {
            mobileMenuOpen = !mobileMenuOpen;
            const nav = document.querySelector('.main-navigation');
            const toggle = document.getElementById('mobile-menu-toggle');
            
            if (mobileMenuOpen) {
                nav.classList.add('mobile-open');
                toggle.classList.add('active');
                document.body.style.overflow = 'hidden';
            } else {
                nav.classList.remove('mobile-open');
                toggle.classList.remove('active');
                document.body.style.overflow = '';
            }
        },

        // ===== UTILITY FUNCTIONS =====
        handleNavigation(e) {
            // Handle navigation clicks
            if (e.target.matches('.nav-item a') && mobileMenuOpen) {
                this.toggleMobileMenu();
            }
        },

        handlePageLoad() {
            // Hide loading screen
            const loadingScreen = document.querySelector('.loading-screen');
            if (loadingScreen) {
                setTimeout(() => {
                    loadingScreen.style.opacity = '0';
                    setTimeout(() => {
                        loadingScreen.style.display = 'none';
                    }, 500);
                }, 1000);
            }
            
            // Initialize page-specific animations
            this.initializePageAnimations();
        },

        initializePageAnimations() {
            // Stagger animation for hero elements
            const heroElements = document.querySelectorAll('.hero-badge, .hero-title, .hero-subtitle, .hero-stats, .hero-actions');
            
            heroElements.forEach((element, index) => {
                element.style.opacity = '0';
                element.style.transform = 'translateY(30px)';
                
                setTimeout(() => {
                    element.style.transition = 'all 0.8s cubic-bezier(0.4, 0, 0.2, 1)';
                    element.style.opacity = '1';
                    element.style.transform = 'translateY(0)';
                }, index * 200 + 500);
            });
        },

        handleResize() {
            // Recalculate positions and animations on resize
            if (window.innerWidth > 768 && mobileMenuOpen) {
                this.toggleMobileMenu();
            }
            
            // Reinitialize particles for new screen size
            const particleContainer = document.getElementById('hero-particles');
            if (particleContainer) {
                particleContainer.innerHTML = '';
                this.createParticleSystem(particleContainer);
            }
        },

        scrollToTop() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        },

        handleFabClick() {
            // Handle floating action button click
            console.log('Chat feature coming soon!');
            this.showNotification('Chat feature coming soon! Please use our contact form for now.', 'info');
        },

        showNotification(message, type = 'info') {
            const notification = document.createElement('div');
            notification.className = `notification notification-${type}`;
            notification.textContent = message;
            notification.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                background: ${type === 'error' ? '#ef4444' : type === 'success' ? '#22c55e' : '#3b82f6'};
                color: white;
                padding: 1rem 1.5rem;
                border-radius: 0.5rem;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                z-index: 10000;
                animation: slideInRight 0.3s ease;
                max-width: 300px;
                font-size: 0.875rem;
                line-height: 1.4;
            `;
            
            document.body.appendChild(notification);
            
            setTimeout(() => {
                notification.style.animation = 'slideOutRight 0.3s ease forwards';
                setTimeout(() => {
                    notification.remove();
                }, 300);
            }, 5000);
        },

        // ===== PERFORMANCE MONITORING =====
        initializePerformanceMonitoring() {
            // Monitor page performance
            if ('performance' in window) {
                window.addEventListener('load', () => {
                    setTimeout(() => {
                        const perfData = performance.timing;
                        const loadTime = perfData.loadEventEnd - perfData.navigationStart;
                        
                        if (loadTime > 3000) {
                            console.warn(`Page load time: ${loadTime}ms - Consider optimization`);
                        }
                    }, 0);
                });
            }
            
            // Monitor scroll performance
            let scrollStart;
            let scrollTimer;
            
            window.addEventListener('scroll', () => {
                if (!scrollStart) {
                    scrollStart = performance.now();
                }
                
                clearTimeout(scrollTimer);
                scrollTimer = setTimeout(() => {
                    const scrollEnd = performance.now();
                    const scrollDuration = scrollEnd - scrollStart;
                    
                    if (scrollDuration > 16) { // More than one frame at 60fps
                        console.warn(`Scroll performance: ${scrollDuration.toFixed(2)}ms`);
                    }
                    
                    scrollStart = null;
                }, 100);
            });
        },

        // ===== HELPER FUNCTIONS =====
        debounce(func, wait) {
            let timeout;
            return function executedFunction(...args) {
                const later = () => {
                    clearTimeout(timeout);
                    func(...args);
                };
                clearTimeout(timeout);
                timeout = setTimeout(later, wait);
            };
        },

        throttle(func, limit) {
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
        },

        // ===== ADVANCED ANIMATIONS =====
        createTypewriterEffect(element, text, speed = 50) {
            if (!element) return;
            
            element.textContent = '';
            let i = 0;
            
            const typeInterval = setInterval(() => {
                if (i < text.length) {
                    element.textContent += text.charAt(i);
                    i++;
                } else {
                    clearInterval(typeInterval);
                }
            }, speed);
        },

        createCountUpAnimation(element, start, end, duration = 2000) {
            if (!element) return;
            
            const range = end - start;
            const minTimer = 50;
            let stepTime = Math.abs(Math.floor(duration / range));
            
            stepTime = Math.max(stepTime, minTimer);
            
            const startTime = new Date().getTime();
            const endTime = startTime + duration;
            let timer;
            
            function run() {
                const now = new Date().getTime();
                const remaining = Math.max((endTime - now) / duration, 0);
                const value = Math.round(end - (remaining * range));
                element.textContent = value;
                
                if (value === end) {
                    clearInterval(timer);
                }
            }
            
            timer = setInterval(run, stepTime);
            run();
        },

        createParallaxElement(element, speed = 0.5) {
            if (!element) return;
            
            const updateParallax = () => {
                const scrolled = window.pageYOffset;
                const parallax = scrolled * speed;
                element.style.transform = `translateY(${parallax}px)`;
            };
            
            window.addEventListener('scroll', this.throttle(updateParallax, 10));
        },

        // ===== MODAL SYSTEM =====
        initializeModals() {
            const modalTriggers = document.querySelectorAll('[data-modal]');
            
            modalTriggers.forEach(trigger => {
                trigger.addEventListener('click', (e) => {
                    e.preventDefault();
                    const modalId = trigger.dataset.modal;
                    this.openModal(modalId);
                });
            });
            
            // Close modal on backdrop click
            document.addEventListener('click', (e) => {
                if (e.target.classList.contains('modal-backdrop')) {
                    this.closeModal();
                }
            });
            
            // Close modal on escape key
            document.addEventListener('keydown', (e) => {
                if (e.key === 'Escape') {
                    this.closeModal();
                }
            });
        },

        openModal(modalId) {
            const modal = document.getElementById(modalId);
            if (!modal) return;
            
            // Create backdrop
            const backdrop = document.createElement('div');
            backdrop.className = 'modal-backdrop';
            backdrop.style.cssText = `
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                backdrop-filter: blur(4px);
                z-index: 1040;
                animation: fadeIn 0.3s ease;
            `;
            
            document.body.appendChild(backdrop);
            
            // Show modal
            modal.style.display = 'block';
            modal.style.zIndex = '1050';
            modal.style.animation = 'modalSlideIn 0.3s ease';
            
            // Prevent body scroll
            document.body.style.overflow = 'hidden';
            
            // Focus management
            const focusableElements = modal.querySelectorAll(
                'button, [href], input, select, textarea, [tabindex]:not([tabindex="-1"])'
            );
            if (focusableElements.length > 0) {
                focusableElements[0].focus();
            }
        },

        closeModal() {
            const backdrop = document.querySelector('.modal-backdrop');
            const modals = document.querySelectorAll('.modal[style*="block"]');
            
            modals.forEach(modal => {
                modal.style.animation = 'modalSlideOut 0.3s ease';
                setTimeout(() => {
                    modal.style.display = 'none';
                }, 300);
            });
            
            if (backdrop) {
                backdrop.style.animation = 'fadeOut 0.3s ease';
                setTimeout(() => {
                    backdrop.remove();
                }, 300);
            }
            
            // Restore body scroll
            document.body.style.overflow = '';
        },

        // ===== LOADING STATES =====
        showLoadingState(element) {
            if (!element) return;
            
            const originalContent = element.innerHTML;
            element.dataset.originalContent = originalContent;
            
            element.innerHTML = `
                <div class="loading-spinner-inline" style="
                    display: inline-block;
                    width: 20px;
                    height: 20px;
                    border: 2px solid rgba(255,255,255,0.3);
                    border-radius: 50%;
                    border-top-color: #fff;
                    animation: spin 1s ease-in-out infinite;
                    margin-right: 8px;
                "></div>
                Loading...
            `;
            
            element.disabled = true;
        },

        hideLoadingState(element) {
            if (!element || !element.dataset.originalContent) return;
            
            element.innerHTML = element.dataset.originalContent;
            element.disabled = false;
            delete element.dataset.originalContent;
        },

        // ===== TOAST NOTIFICATIONS =====
        showToast(message, type = 'info', duration = 5000) {
            const toast = document.createElement('div');
            toast.className = `toast toast-${type}`;
            
            const colors = {
                info: '#3b82f6',
                success: '#22c55e',
                warning: '#f59e0b',
                error: '#ef4444'
            };
            
            toast.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                background: ${colors[type]};
                color: white;
                padding: 1rem 1.5rem;
                border-radius: 0.75rem;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
                z-index: 10000;
                animation: toastSlideIn 0.3s ease;
                max-width: 350px;
                font-size: 0.875rem;
                line-height: 1.4;
                margin-bottom: 1rem;
                display: flex;
                align-items: center;
                gap: 0.75rem;
            `;
            
            // Add icon based on type
            const icons = {
                info: '💡',
                success: '✅',
                warning: '⚠️',
                error: '❌'
            };
            
            toast.innerHTML = `
                <span class="toast-icon">${icons[type]}</span>
                <span class="toast-message">${message}</span>
                <button class="toast-close" style="
                    background: none;
                    border: none;
                    color: white;
                    font-size: 1.2rem;
                    cursor: pointer;
                    padding: 0;
                    margin-left: auto;
                ">×</button>
            `;
            
            // Position multiple toasts
            const existingToasts = document.querySelectorAll('.toast');
            const offset = existingToasts.length * 80;
            toast.style.top = `${20 + offset}px`;
            
            document.body.appendChild(toast);
            
            // Close button functionality
            const closeBtn = toast.querySelector('.toast-close');
            closeBtn.addEventListener('click', () => {
                this.removeToast(toast);
            });
            
            // Auto remove
            setTimeout(() => {
                this.removeToast(toast);
            }, duration);
            
            return toast;
        },

        removeToast(toast) {
            if (!toast || !toast.parentNode) return;
            
            toast.style.animation = 'toastSlideOut 0.3s ease forwards';
            setTimeout(() => {
                if (toast.parentNode) {
                    toast.remove();
                }
                // Reposition remaining toasts
                this.repositionToasts();
            }, 300);
        },

        repositionToasts() {
            const toasts = document.querySelectorAll('.toast');
            toasts.forEach((toast, index) => {
                toast.style.top = `${20 + (index * 80)}px`;
            });
        },

        // ===== SEARCH FUNCTIONALITY =====
        initializeSearch() {
            const searchInput = document.querySelector('.search-input');
            const searchResults = document.querySelector('.search-results');
            
            if (!searchInput) return;
            
            searchInput.addEventListener('input', this.debounce((e) => {
                const query = e.target.value.trim();
                if (query.length > 2) {
                    this.performSearch(query);
                } else {
                    this.hideSearchResults();
                }
            }, 300));
            
            // Hide results when clicking outside
            document.addEventListener('click', (e) => {
                if (!e.target.closest('.search-container')) {
                    this.hideSearchResults();
                }
            });
        },

        performSearch(query) {
            // This is a mock search - replace with actual search implementation
            const mockResults = [
                { title: 'AI Solutions', url: '#services', type: 'Service' },
                { title: 'Blockchain Development', url: '#services', type: 'Service' },
                { title: 'Our Team', url: '#team', type: 'Page' },
                { title: 'Contact Us', url: '#contact', type: 'Page' }
            ].filter(item => 
                item.title.toLowerCase().includes(query.toLowerCase())
            );
            
            this.displaySearchResults(mockResults);
        },

        displaySearchResults(results) {
            const searchResults = document.querySelector('.search-results');
            if (!searchResults) return;
            
            if (results.length === 0) {
                searchResults.innerHTML = '<div class="search-no-results">No results found</div>';
            } else {
                searchResults.innerHTML = results.map(result => `
                    <a href="${result.url}" class="search-result-item">
                        <div class="search-result-title">${result.title}</div>
                        <div class="search-result-type">${result.type}</div>
                    </a>
                `).join('');
            }
            
            searchResults.style.display = 'block';
        },

        hideSearchResults() {
            const searchResults = document.querySelector('.search-results');
            if (searchResults) {
                searchResults.style.display = 'none';
            }
        },

        // ===== ACCESSIBILITY ENHANCEMENTS =====
        initializeAccessibility() {
            // Skip link functionality
            this.setupSkipLinks();
            
            // Keyboard navigation
            this.setupKeyboardNavigation();
            
            // Focus management
            this.setupFocusManagement();
            
            // ARIA live regions
            this.setupLiveRegions();
        },

        setupSkipLinks() {
            const skipLink = document.querySelector('.skip-link');
            if (skipLink) {
                skipLink.addEventListener('click', (e) => {
                    e.preventDefault();
                    const target = document.querySelector(skipLink.getAttribute('href'));
                    if (target) {
                        target.focus();
                        target.scrollIntoView();
                    }
                });
            }
        },

        setupKeyboardNavigation() {
            // Dropdown menus keyboard navigation
            const dropdowns = document.querySelectorAll('.dropdown');
            
            dropdowns.forEach(dropdown => {
                const trigger = dropdown.querySelector('a');
                const menu = dropdown.querySelector('.dropdown-menu');
                
                if (!trigger || !menu) return;
                
                trigger.addEventListener('keydown', (e) => {
                    if (e.key === 'Enter' || e.key === ' ') {
                        e.preventDefault();
                        menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
                    }
                });
            });
        },

        setupFocusManagement() {
            // Visible focus indicators
            document.addEventListener('keydown', (e) => {
                if (e.key === 'Tab') {
                    document.body.classList.add('keyboard-navigation');
                }
            });
            
            document.addEventListener('mousedown', () => {
                document.body.classList.remove('keyboard-navigation');
            });
        },

        setupLiveRegions() {
            // Create live region for dynamic content announcements
            const liveRegion = document.createElement('div');
            liveRegion.setAttribute('aria-live', 'polite');
            liveRegion.setAttribute('aria-atomic', 'true');
            liveRegion.className = 'sr-only';
            liveRegion.id = 'live-region';
            document.body.appendChild(liveRegion);
        },

        announceToScreenReader(message) {
            const liveRegion = document.getElementById('live-region');
            if (liveRegion) {
                liveRegion.textContent = message;
            }
        }
    };

    // ===== CSS ANIMATIONS =====
    const cssAnimations = `
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        
        @keyframes fadeOut {
            from { opacity: 1; }
            to { opacity: 0; }
        }
        
        @keyframes slideInRight {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        
        @keyframes slideOutRight {
            from { transform: translateX(0); opacity: 1; }
            to { transform: translateX(100%); opacity: 0; }
        }
        
        @keyframes slideInDown {
            from { transform: translateY(-100%); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        
        @keyframes modalSlideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        
        @keyframes modalSlideOut {
            from { transform: translateY(0); opacity: 1; }
            to { transform: translateY(-50px); opacity: 0; }
        }
        
        @keyframes toastSlideIn {
            from { transform: translateX(100%); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        
        @keyframes toastSlideOut {
            from { transform: translateX(0); opacity: 1; }
            to { transform: translateX(100%); opacity: 0; }
        }
        
        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }
        
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }
        
        /* Focus styles for keyboard navigation */
        .keyboard-navigation *:focus {
            outline: 3px solid #05b305 !important;
            outline-offset: 2px !important;
        }
        
        /* Loading spinner */
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        /* Fade in animations */
        .fade-in-up {
            animation: fadeInUp 0.8s ease forwards;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Hover effects */
        .hover-lift {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .hover-lift:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }
        
        /* Mobile menu animations */
        .mobile-menu-toggle.active .hamburger-line:nth-child(1) {
            transform: rotate(45deg) translate(5px, 5px);
        }
        
        .mobile-menu-toggle.active .hamburger-line:nth-child(2) {
            opacity: 0;
        }
        
        .mobile-menu-toggle.active .hamburger-line:nth-child(3) {
            transform: rotate(-45deg) translate(7px, -6px);
        }
        
        /* Smooth transitions */
        * {
            transition: color 0.3s ease, background-color 0.3s ease, border-color 0.3s ease, opacity 0.3s ease;
        }
    `;

    // Add CSS animations to document
    const styleSheet = document.createElement('style');
    styleSheet.textContent = cssAnimations;
    document.head.appendChild(styleSheet);

    // ===== GLOBAL FUNCTIONS =====
    
    // Export functions to global scope for Shiny integration
    window.FevaAnimations = FevaAnimations;
    
    window.toggleTheme = function(theme) {
        FevaAnimations.setTheme(theme);
    };
    
    window.toggleMobileMenu = function(state) {
        if (state !== mobileMenuOpen) {
            FevaAnimations.toggleMobileMenu();
        }
    };
    
    window.smoothScrollTo = function(selector) {
        const element = document.querySelector(selector);
        if (element) {
            FevaAnimations.smoothScrollTo(element);
        }
    };
    
    window.smoothScrollToTop = function() {
        FevaAnimations.scrollToTop();
    };
    
    window.animateServiceCards = function() {
        const cards = document.querySelectorAll('.service-card');
        cards.forEach((card, index) => {
            setTimeout(() => {
                card.style.animation = 'fadeInUp 0.8s ease forwards';
            }, index * 100);
        });
    };
    
    window.filterPortfolioItems = function(filter) {
        FevaAnimations.filterPortfolioItems(filter);
    };
    
    window.updateFilterButtons = function(filter) {
        FevaAnimations.updateFilterButtons(filter);
    };
    
    window.showFormStep = function(step) {
        FevaAnimations.showFormStep(step);
    };
    
    window.resetContactForm = function() {
        const form = document.querySelector('.contact-form');
        if (form) {
            form.reset();
            FevaAnimations.showFormStep(1);
        }
    };
    
    window.showLoadingState = function() {
        const submitBtn = document.getElementById('submit_project');
        if (submitBtn) {
            FevaAnimations.showLoadingState(submitBtn);
        }
    };
    
    window.hideLoadingState = function() {
        const submitBtn = document.getElementById('submit_project');
        if (submitBtn) {
            FevaAnimations.hideLoadingState(submitBtn);
        }
    };
    
    window.showDemoProcessing = function() {
        const analyzeBtn = document.getElementById('analyze_demo');
        if (analyzeBtn) {
            FevaAnimations.showLoadingState(analyzeBtn);
        }
    };
    
    window.updateDemoResults = function() {
        const results = document.querySelector('.demo-output .results-placeholder');
        if (results) {
            results.style.animation = 'fadeInUp 0.6s ease forwards';
        }
    };
    
    window.trackPageInteraction = function() {
        // Track user interactions for analytics
        console.log('Page interaction tracked');
    };
    
    window.setInitialTheme = function() {
        FevaAnimations.initializeTheme();
    };
    
    window.initializeScrollEffects = function() {
        FevaAnimations.initializeScrollEffects();
    };
    
    window.initializeApp = function() {
        FevaAnimations.init();
    };
    
    window.showCookieBannerIfNeeded = function() {
        // Check if cookie consent is needed
        if (!localStorage.getItem('feva-cookies-accepted')) {
            // Show cookie banner (implement as needed)
            console.log('Cookie banner should be shown');
        }
    };

    // ===== AUTO INITIALIZATION =====
    
    // Initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            FevaAnimations.init();
        });
    } else {
        FevaAnimations.init();
    }

    // Initialize additional features when fully loaded
    window.addEventListener('load', () => {
        // Additional initialization after full page load
        setTimeout(() => {
            // Performance optimizations
            FevaAnimations.initializePerformanceMonitoring();
            
            // Advanced features
            FevaAnimations.initializeAccessibility();
            FevaAnimations.initializeModals();
            FevaAnimations.initializeSearch();
            
            console.log('🎉 Feva Advanced Features Loaded');
        }, 1000);
    });

})();