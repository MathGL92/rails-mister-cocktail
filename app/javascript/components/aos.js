import AOS from 'aos';
import 'aos/dist/aos.css';

const aos = () => {
  if (document.querySelector('.card-category') || document.querySelector('.cocktail-dashboard-card')) {
    AOS.init();
  }
};

export { aos };
