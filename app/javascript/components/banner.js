import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  if (document.getElementById('banner-typed-text')) {
    new Typed('#banner-typed-text', {
    strings: ["Welcome to Cocktail Lover", "Share your recipes or simply enjoy ours!"],
    typeSpeed: 50,
    loop: true
    });
  }
}

export { loadDynamicBannerText };
