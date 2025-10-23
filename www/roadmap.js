/**
 * Smooth Interactive Roadmap with Accurate Scroll Synchronization
 * Professional, clean, and smooth animations
 */

class InteractiveRoadmap {
  constructor() {
    this.roadmapContainer = null;
    this.roadmapLine = null;
    this.steps = [];
    this.visibleSteps = new Set();
    this.isAnimating = false;
    this.scrollProgress = 0;
    this.lastScrollTime = 0;
    this.animationFrame = null;
    
    this.init();
  }

  init() {
    // Wait for DOM to be ready
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', () => this.setup());
    } else {
      this.setup();
    }
  }

  setup() {
    this.roadmapContainer = document.querySelector('.roadmap-container');
    this.roadmapLine = document.querySelector('.roadmap-line');
    this.steps = document.querySelectorAll('.roadmap-step');
    
    if (!this.roadmapContainer || !this.roadmapLine || this.steps.length === 0) {
      console.warn('Roadmap elements not found');
      return;
    }

    this.setupScrollListener();
    this.setupIntersectionObserver();
    this.initializeSteps();
    
    // Initial check for visible steps
    this.checkVisibleSteps();
  }

  setupScrollListener() {
    let ticking = false;
    
    const handleScroll = () => {
      const now = Date.now();
      this.lastScrollTime = now;
      
      if (!ticking) {
        this.animationFrame = requestAnimationFrame(() => {
          this.updateRoadmapProgress();
          this.updateStepVisibility();
          ticking = false;
        });
        ticking = true;
      }
    };

    window.addEventListener('scroll', handleScroll, { passive: true });
  }

  setupIntersectionObserver() {
    const observerOptions = {
      root: null,
      rootMargin: '-20% 0px -20% 0px',
      threshold: [0, 0.1, 0.3, 0.5, 0.7, 1.0]
    };

    this.observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        const step = entry.target;
        const stepNumber = step.dataset.step;
        const intersectionRatio = entry.intersectionRatio;
        
        // More granular visibility control
        if (intersectionRatio > 0.1) {
          this.showStep(step, stepNumber, intersectionRatio);
        } else if (intersectionRatio === 0) {
          this.hideStep(step, stepNumber);
        }
      });
    }, observerOptions);

    this.steps.forEach(step => {
      this.observer.observe(step);
    });
  }

  initializeSteps() {
    this.steps.forEach((step, index) => {
      // Add staggered delay for initial animation
      step.style.transitionDelay = `${index * 0.15}s`;
      
      // Initialize typing animation for text elements
      this.setupTypingAnimation(step);
    });
  }

  showStep(step, stepNumber, visibilityRatio = 1) {
    if (this.visibleSteps.has(stepNumber)) return;
    
    this.visibleSteps.add(stepNumber);
    
    // Smooth animation with visibility-based timing
    const delay = visibilityRatio < 0.5 ? 300 : 0;
    
    setTimeout(() => {
      step.classList.add('visible');
      
      // Animate the roadmap line progress
      this.animateRoadmapLine(stepNumber);
      
      // Trigger typing animation for this step
      this.triggerTypingAnimation(step);
      
      // Add pulse effect to the step marker
      this.addPulseEffect(step);
    }, delay);
  }

  hideStep(step, stepNumber) {
    if (!this.visibleSteps.has(stepNumber)) return;
    
    this.visibleSteps.delete(stepNumber);
    step.classList.remove('visible');
    
    // Reset typing animation
    this.resetTypingAnimation(step);
  }

  updateStepVisibility() {
    const containerRect = this.roadmapContainer.getBoundingClientRect();
    const windowHeight = window.innerHeight;
    const containerTop = containerRect.top;
    const containerHeight = containerRect.height;
    
    // Calculate scroll progress through the roadmap
    const scrollProgress = Math.max(0, Math.min(1, 
      (windowHeight - containerTop) / (windowHeight + containerHeight)
    ));
    
    this.scrollProgress = scrollProgress;
    
    // Update each step based on scroll position
    this.steps.forEach((step, index) => {
      const stepNumber = step.dataset.step;
      const stepProgress = (index + 1) / this.steps.length;
      
      // Show step when scroll reaches its position
      if (scrollProgress >= stepProgress - 0.1 && !this.visibleSteps.has(stepNumber)) {
        this.showStep(step, stepNumber);
      }
    });
  }

  animateRoadmapLine(stepNumber) {
    if (this.isAnimating) return;
    
    this.isAnimating = true;
    
    // Calculate progress based on visible steps
    const progress = this.visibleSteps.size / this.steps.length;
    const dashOffset = 2000 * (1 - progress);
    
    // Smooth animation with easing
    this.animateValue(
      parseFloat(this.roadmapLine.style.strokeDashoffset) || 2000,
      dashOffset,
      1500,
      (value) => {
        this.roadmapLine.style.strokeDashoffset = value;
      },
      () => {
        this.isAnimating = false;
      }
    );
    
    this.roadmapLine.classList.add('animate');
  }

  animateValue(start, end, duration, callback, onComplete) {
    const startTime = performance.now();
    
    const animate = (currentTime) => {
      const elapsed = currentTime - startTime;
      const progress = Math.min(elapsed / duration, 1);
      
      // Easing function for smooth animation
      const easeOutCubic = 1 - Math.pow(1 - progress, 3);
      const currentValue = start + (end - start) * easeOutCubic;
      
      callback(currentValue);
      
      if (progress < 1) {
        requestAnimationFrame(animate);
      } else if (onComplete) {
        onComplete();
      }
    };
    
    requestAnimationFrame(animate);
  }

  updateRoadmapProgress() {
    if (!this.roadmapContainer) return;
    
    const rect = this.roadmapContainer.getBoundingClientRect();
    const windowHeight = window.innerHeight;
    
    // Calculate how much of the roadmap is visible
    const visibleTop = Math.max(0, -rect.top);
    const visibleHeight = Math.min(rect.height, windowHeight - Math.max(0, rect.top));
    const progress = Math.min(1, visibleTop / (rect.height - windowHeight));
    
    // Smooth line animation based on scroll progress
    if (progress > 0) {
      const dashOffset = 2000 * (1 - progress);
      
      // Use smooth animation for line drawing
      this.animateValue(
        parseFloat(this.roadmapLine.style.strokeDashoffset) || 2000,
        dashOffset,
        100,
        (value) => {
          this.roadmapLine.style.strokeDashoffset = value;
        }
      );
    }
  }

  setupTypingAnimation(step) {
    const titleElement = step.querySelector('.step-title');
    const descriptionElement = step.querySelector('.step-description');
    
    if (titleElement) {
      this.prepareTypingElement(titleElement);
    }
    
    if (descriptionElement) {
      this.prepareTypingElement(descriptionElement);
    }
  }

  prepareTypingElement(element) {
    const originalText = element.textContent;
    element.textContent = '';
    element.dataset.originalText = originalText;
    element.classList.add('typing-ready');
  }

  triggerTypingAnimation(step) {
    const titleElement = step.querySelector('.step-title');
    const descriptionElement = step.querySelector('.step-description');
    
    // Animate title first with smooth timing
    if (titleElement && titleElement.classList.contains('typing-ready')) {
      setTimeout(() => {
        this.typeText(titleElement, 30); // Faster typing
      }, 200);
    }
    
    // Then animate description with smooth timing
    if (descriptionElement && descriptionElement.classList.contains('typing-ready')) {
      setTimeout(() => {
        this.typeText(descriptionElement, 25); // Slightly slower for readability
      }, 800);
    }
  }

  resetTypingAnimation(step) {
    const titleElement = step.querySelector('.step-title');
    const descriptionElement = step.querySelector('.step-description');
    
    if (titleElement) {
      titleElement.textContent = titleElement.dataset.originalText || '';
      titleElement.classList.remove('typing-text');
      titleElement.classList.add('typing-ready');
    }
    
    if (descriptionElement) {
      descriptionElement.textContent = descriptionElement.dataset.originalText || '';
      descriptionElement.classList.remove('typing-text');
      descriptionElement.classList.add('typing-ready');
    }
  }

  typeText(element, typingSpeed = 30) {
    const originalText = element.dataset.originalText;
    
    element.classList.remove('typing-ready');
    element.classList.add('typing-text');
    
    let currentIndex = 0;
    
    const typeInterval = setInterval(() => {
      if (currentIndex < originalText.length) {
        element.textContent = originalText.substring(0, currentIndex + 1);
        currentIndex++;
      } else {
        clearInterval(typeInterval);
        element.classList.remove('typing-text');
        element.textContent = originalText;
      }
    }, typingSpeed);
  }

  addPulseEffect(step) {
    const pulseElement = step.querySelector('.step-pulse');
    if (pulseElement) {
      pulseElement.style.animation = 'none';
      pulseElement.offsetHeight; // Trigger reflow
      pulseElement.style.animation = 'pulse 3s infinite';
    }
  }

  checkVisibleSteps() {
    this.steps.forEach(step => {
      const rect = step.getBoundingClientRect();
      const windowHeight = window.innerHeight;
      
      if (rect.top < windowHeight * 0.7 && rect.bottom > windowHeight * 0.3) {
        const stepNumber = step.dataset.step;
        if (!this.visibleSteps.has(stepNumber)) {
          this.showStep(step, stepNumber);
        }
      }
    });
  }

  // Public method to reset animations (useful for testing)
  reset() {
    this.visibleSteps.clear();
    this.steps.forEach(step => {
      step.classList.remove('visible');
      this.resetTypingAnimation(step);
    });
    
    this.roadmapLine.style.strokeDashoffset = '2000';
    this.roadmapLine.classList.remove('animate');
  }

  // Smooth scroll to specific step
  scrollToStep(stepNumber) {
    const step = document.querySelector(`[data-step="${stepNumber}"]`);
    if (step) {
      const containerRect = this.roadmapContainer.getBoundingClientRect();
      const stepRect = step.getBoundingClientRect();
      const scrollTop = window.pageYOffset + stepRect.top - window.innerHeight / 2;
      
      window.scrollTo({
        top: scrollTop,
        behavior: 'smooth'
      });
    }
  }
}

// Initialize the roadmap when the script loads
const roadmap = new InteractiveRoadmap();

// Export for potential external use
if (typeof module !== 'undefined' && module.exports) {
  module.exports = InteractiveRoadmap;
}
