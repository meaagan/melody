import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Giving new musicians the chance to rent before they buy"],
    typeSpeed: 65,
    loop: true
  });
}

export { loadDynamicBannerText };
