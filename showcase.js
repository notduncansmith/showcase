// Generated by CoffeeScript 1.7.1
(function() {
  window.showcase = function(selector) {
    var clone, cloneStyles, poppedOut, r, target;
    poppedOut = document.querySelector('[sc-popped]');
    if (poppedOut != null) {
      poppedOut.parentNode.removeChild(poppedOut);
    }
    target = document.querySelector(selector);
    r = target.getBoundingClientRect();
    clone = document.createElement('div');
    cloneStyles = "top: " + r.top + "px; left: " + r.left + "px; width: " + r.width + "px; height: " + r.height + "px;";
    cloneStyles += 'position: absolute; box-shadow: rgba(0,0,0,0.6) 0 0 0 30000px, 0 0 25px #000;';
    clone.setAttribute('style', cloneStyles);
    clone.setAttribute('sc-popped', true);
    return document.body.appendChild(clone);
  };

}).call(this);
