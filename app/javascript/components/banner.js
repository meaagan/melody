import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Rent before you buy"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
