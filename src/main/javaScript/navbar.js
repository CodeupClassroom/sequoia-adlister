window.onload = function () {


  function getScrollTop() {
      if (typeof window.pageYOffset !== 'undefined') {

          return window.pageYOffset;
      }
      const d = document.documentElement;
      if (d.clientHeight) {
          return d.scrollTop;
      }

      window.onscroll = function () {
          const box = document.getElementById('box'),
              scroll = getScrollTop();
          if (scroll <= 28) {
              box.style.top = "30px";
          }
          else {
              box.style.top = (scroll + 2) + "px";
          }
      }

  }

};