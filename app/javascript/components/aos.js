import AOS from 'aos';

const aos = () => {
  if (document.querySelector('.card-category')) {
    AOS.init();
  }
};

export { aos };
