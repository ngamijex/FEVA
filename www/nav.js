// Advanced Tech Navbar JavaScript

document.addEventListener('DOMContentLoaded', function() {
    // Header scroll effect
    const header = document.getElementById('site-header');
    const navItems = document.querySelectorAll('.nav-item');
    const mobileToggle = document.getElementById('mobile-menu-toggle');
    
    // Smooth scroll behavior for navigation links
    function initSmoothScroll() {
        const navLinks = document.querySelectorAll('.nav-item a[href^="#"]');
        
        navLinks.forEach(link => {
            link.addEventListener('click', function(e) {
                e.preventDefault();
                const targetId = this.getAttribute('href').substring(1);
                const targetElement = document.getElementById(targetId);
                
                if (targetElement) {
                    const headerHeight = header.offsetHeight;
                    const targetPosition = targetElement.offsetTop - headerHeight - 20;
                    
                    window.scrollTo({
                        top: targetPosition,
                        behavior: 'smooth'
                    });
                    
                    // Update active nav item
                    updateActiveNavItem(this.closest('.nav-item'));
                }
            });
        });
    }
    
    // Header scroll effects - Disabled to keep navbar transparent
    function handleScroll() {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        
        // Keep navbar transparent - no scrolled class added
        // if (scrollTop > 100) {
        //     header.classList.add('scrolled');
        // } else {
        //     header.classList.remove('scrolled');
        // }
        
        // Handle intersection observer for active nav items
        updateActiveNavOnScroll();
    }
    
    // Update active navigation item
    function updateActiveNavItem(activeItem) {
        navItems.forEach(item => item.classList.remove('active'));
        if (activeItem) {
            activeItem.classList.add('active');
        }
    }
    
    // Intersection Observer for automatic nav highlighting
    function initScrollSpy() {
        const sections = document.querySelectorAll('section[id]');
        const navLinks = document.querySelectorAll('.nav-item a[href^="#"]');
        
        const observerOptions = {
            root: null,
            rootMargin: '-20% 0px -80% 0px',
            threshold: 0
        };
        
        const observer = new IntersectionObserver(function(entries) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const id = entry.target.getAttribute('id');
                    const correspondingNavItem = document.querySelector(`.nav-item a[href="#${id}"]`)?.closest('.nav-item');
                    
                    if (correspondingNavItem) {
                        updateActiveNavItem(correspondingNavItem);
                    }
                }
            });
        }, observerOptions);
        
        sections.forEach(section => {
            observer.observe(section);
        });
    }
    
    // Mobile menu functionality
    function initMobileMenu() {
        const mainNav = document.getElementById('main-nav');
        
        mobileToggle.addEventListener('click', function() {
            this.classList.toggle('active');
            mainNav.classList.toggle('mobile-active');
            document.body.classList.toggle('nav-open');
        });
        
        // Close mobile menu when clicking nav links
        const navLinks = document.querySelectorAll('.nav-item a');
        navLinks.forEach(link => {
            link.addEventListener('click', function() {
                mobileToggle.classList.remove('active');
                mainNav.classList.remove('mobile-active');
                document.body.classList.remove('nav-open');
            });
        });
        
        // Close mobile menu when clicking outside
        document.addEventListener('click', function(e) {
            if (!mainNav.contains(e.target) && !mobileToggle.contains(e.target)) {
                mobileToggle.classList.remove('active');
                mainNav.classList.remove('mobile-active');
                document.body.classList.remove('nav-open');
            }
        });
    }
    
    // Dropdown menu enhancements
    function initDropdowns() {
        const dropdowns = document.querySelectorAll('.dropdown');
        
        dropdowns.forEach(dropdown => {
            const menu = dropdown.querySelector('.dropdown-menu');
            let timeoutId;
            
            dropdown.addEventListener('mouseenter', function() {
                clearTimeout(timeoutId);
                menu.style.display = 'block';
                setTimeout(() => {
                    menu.style.opacity = '1';
                    menu.style.transform = 'translateX(-50%) translateY(0)';
                }, 10);
            });
            
            dropdown.addEventListener('mouseleave', function() {
                menu.style.opacity = '0';
                menu.style.transform = 'translateX(-50%) translateY(-10px)';
                
                timeoutId = setTimeout(() => {
                    menu.style.display = 'none';
                }, 300);
            });
        });
    }
    
    // Keyboard navigation
    function initKeyboardNavigation() {
        const navItems = document.querySelectorAll('.nav-item a, .btn-cta, .mobile-menu-toggle');
        
        navItems.forEach((item, index) => {
            item.addEventListener('keydown', function(e) {
                let nextIndex;
                
                switch(e.key) {
                    case 'ArrowRight':
                        e.preventDefault();
                        nextIndex = (index + 1) % navItems.length;
                        navItems[nextIndex].focus();
                        break;
                    case 'ArrowLeft':
                        e.preventDefault();
                        nextIndex = (index - 1 + navItems.length) % navItems.length;
                        navItems[nextIndex].focus();
                        break;
                    case 'Escape':
                        this.blur();
                        break;
                }
            });
        });
    }
    
    // Performance optimized scroll handler
    let ticking = false;
    function requestTick() {
        if (!ticking) {
            requestAnimationFrame(handleScroll);
            ticking = true;
        }
    }
    
    function updateActiveNavOnScroll() {
        ticking = false;
    }
    
    // Theme toggle functionality (if you want to add it)
    function initThemeToggle() {
        const themeToggle = document.getElementById('theme-toggle');
        if (themeToggle) {
            themeToggle.addEventListener('click', function() {
                const currentTheme = document.documentElement.getAttribute('data-theme');
                const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
                
                document.documentElement.setAttribute('data-theme', newTheme);
                localStorage.setItem('theme', newTheme);
                
                // Add visual feedback
                this.style.transform = 'rotate(180deg)';
                setTimeout(() => {
                    this.style.transform = 'rotate(0deg)';
                }, 300);
            });
            
            // Load saved theme
            const savedTheme = localStorage.getItem('theme') || 'light';
            document.documentElement.setAttribute('data-theme', savedTheme);
        }
    }
    
    // CTA button click effect
    function initCTAEffects() {
        const ctaButton = document.querySelector('.btn-cta');
        if (ctaButton) {
            ctaButton.addEventListener('click', function(e) {
                // Create ripple effect
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
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
                    animation: ripple 0.6s linear;
                    pointer-events: none;
                `;
                
                this.appendChild(ripple);
                
                setTimeout(() => {
                    ripple.remove();
                }, 600);
            });
        }
    }
    
    // Add ripple animation styles
    const rippleStyles = document.createElement('style');
    rippleStyles.textContent = `
        @keyframes ripple {
            to {
                transform: scale(2);
                opacity: 0;
            }
        }
        
        .btn-cta {
            position: relative;
            overflow: hidden;
        }
    `;
    document.head.appendChild(rippleStyles);
    
    // Initialize all functionality
    initSmoothScroll();
    initScrollSpy();
    initMobileMenu();
    initDropdowns();
    initKeyboardNavigation();
    initThemeToggle();
    initCTAEffects();
    
    // Event listeners
    window.addEventListener('scroll', requestTick, { passive: true });
    window.addEventListener('resize', function() {
        // Handle responsive behavior
        if (window.innerWidth > 768) {
            mobileToggle.classList.remove('active');
            document.getElementById('main-nav').classList.remove('mobile-active');
            document.body.classList.remove('nav-open');
        }
    });
    
    // Page load animations
    setTimeout(() => {
        header.classList.add('loaded');
        navItems.forEach((item, index) => {
            setTimeout(() => {
                item.style.opacity = '1';
                item.style.transform = 'translateY(0)';
            }, index * 100);
        });
    }, 100);
});

// Additional utility functions for enhanced UX
function highlightNavOnExternalTrigger(sectionId) {
    const navItem = document.querySelector(`.nav-item a[href="#${sectionId}"]`)?.closest('.nav-item');
    if (navItem) {
        updateActiveNavItem(navItem);
    }
}

// Export functions for R Shiny integration
if (typeof Shiny !== 'undefined') {
    Shiny.addCustomMessageHandler('highlightNav', function(message) {
        highlightNavOnExternalTrigger(message.section);
    });
    
    Shiny.addCustomMessageHandler('scrollToSection', function(message) {
        const element = document.getElementById(message.section);
        if (element) {
            const headerHeight = document.getElementById('site-header').offsetHeight;
            const targetPosition = element.offsetTop - headerHeight - 20;
            
            window.scrollTo({
                top: targetPosition,
                behavior: 'smooth'
            });
        }
    });
}