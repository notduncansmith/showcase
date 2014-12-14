# Showcase - An easy way to draw attention to specific elements

Showcase is a tiny library that helps you highlight a specific element on a page, by darkening the rest of the page.

## Example 

![Example Screenshot](http://puu.sh/7fShk.png)

## Usage

```javascript
showcase('#title');
```


## Annotated Source

The `showcase` function is what we'll use to highlight elements.  Just pass it a CSS selector like you would with jQuery.

    window.showcase = (selector) ->

Before we do any popping *out* of elements, we should make sure everything else is popped back *in*.
I feel like if you're going to use an effect like this, you should only use it on one element at a time.
        
      poppedOut = document.querySelector '[sc-popped]'
      if poppedOut? 
        poppedOut.parentNode.removeChild poppedOut

Now, we need to grab the element to highlight.
    
      target = document.querySelector selector

Next, collect the measurements of that element so that we can create an element of equal size and positioning.

      r = target.getBoundingClientRect()
        
      clone = document.createElement 'div'
      cloneStyles = "
      top: #{r.top}px; 
      left: #{r.left}px; 
      width: #{r.width}px; 
      height: #{r.height}px;"

We need a few more supporting styles to make this work:

      cloneStyles += 'position: absolute; 
      box-shadow: rgba(0,0,0,0.6) 0 0 0 30000px, 0 0 25px #000;'
      clone.setAttribute 'style', cloneStyles
      clone.setAttribute 'sc-popped', true

And finally, shove that sucker into the DOM.

      document.body.appendChild clone
