// Binary Matrix Code Rain Animation
class MatrixRain {
  constructor() {
    this.container = document.getElementById('matrixRain');
    this.characters = '01ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()_+-=[]{}|;:,.<>?';
    this.columns = [];
    this.columnCount = 0;
    this.isRunning = false;
    
    this.init();
  }
  
  init() {
    if (!this.container) return;
    
    this.calculateColumns();
    this.createColumns();
    this.startAnimation();
  }
  
  calculateColumns() {
    const containerWidth = this.container.offsetWidth;
    this.columnCount = Math.floor(containerWidth / 20); // 20px per column
  }
  
  createColumns() {
    for (let i = 0; i < this.columnCount; i++) {
      const column = document.createElement('div');
      column.className = 'matrix-column';
      column.style.left = `${i * 20}px`;
      
      // Random delay and duration
      const delay = Math.random() * 2;
      const duration = 3 + Math.random() * 2; // 3-5 seconds
      
      column.style.animationDelay = `${delay}s`;
      column.style.animationDuration = `${duration}s`;
      
      this.generateColumnContent(column);
      this.container.appendChild(column);
      this.columns.push(column);
    }
  }
  
  generateColumnContent(column) {
    const characterCount = 20 + Math.floor(Math.random() * 10); // 20-30 characters
    
    for (let i = 0; i < characterCount; i++) {
      const character = document.createElement('span');
      character.className = 'matrix-character';
      character.textContent = this.getRandomCharacter();
      
      // Randomly highlight some characters
      if (Math.random() < 0.1) {
        character.classList.add('highlight');
      }
      
      column.appendChild(character);
    }
  }
  
  getRandomCharacter() {
    return this.characters[Math.floor(Math.random() * this.characters.length)];
  }
  
  startAnimation() {
    this.isRunning = true;
    this.updateCharacters();
  }
  
  updateCharacters() {
    if (!this.isRunning) return;
    
    // Update characters in random columns
    this.columns.forEach((column, index) => {
      if (Math.random() < 0.1) { // 10% chance to update each column
        const characters = column.querySelectorAll('.matrix-character');
        characters.forEach(char => {
          if (Math.random() < 0.3) { // 30% chance to change each character
            char.textContent = this.getRandomCharacter();
            
            // Randomly add/remove highlight
            if (Math.random() < 0.1) {
              char.classList.toggle('highlight');
            }
          }
        });
      }
    });
    
    // Continue animation
    setTimeout(() => this.updateCharacters(), 100);
  }
  
  stopAnimation() {
    this.isRunning = false;
  }
  
  destroy() {
    this.stopAnimation();
    if (this.container) {
      this.container.innerHTML = '';
    }
    this.columns = [];
  }
  
  // Handle window resize
  resize() {
    this.destroy();
    setTimeout(() => this.init(), 100);
  }
}

// Initialize Matrix Rain
document.addEventListener('DOMContentLoaded', () => {
  const matrixRain = new MatrixRain();
  
  // Handle window resize
  window.addEventListener('resize', () => {
    matrixRain.resize();
  });
  
  // Re-initialize if Shiny updates the DOM
  if (typeof Shiny !== 'undefined') {
    $(document).on('shiny:value', function(event) {
      setTimeout(() => {
        if (document.getElementById('matrixRain')) {
          new MatrixRain();
        }
      }, 100);
    });
  }
});
