import AOS from 'aos';
import 'aos/dist/aos.css';

const aos = () => {
  if (document.querySelector('.card-category')) {
    AOS.init();
  }
};

export { aos };
