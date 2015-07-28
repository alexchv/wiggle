function getPathTo(element) {
  if (element.id!=='')
    return 'id("'+element.id+'")';
  if (element===document.body)
    return element.tagName;

  var ix= 0;
  var siblings= element.parentNode.childNodes;
  for (var i= 0; i<siblings.length; i++) {
    var sibling= siblings[i];
    if (sibling===element)
      return getPathTo(element.parentNode)+'/'+element.tagName+'['+(ix+1)+']';
    if (sibling.nodeType===1 && sibling.tagName===element.tagName)
      ix++;
  }
}

document.body.onmouseover= function(ev){
  ev.target.style.boxShadow = "0px 0px 5px red";
  curXpath = getPathTo(ev.target);
};

document.body.onmouseout= function(ev){
  ev.target.style.boxShadow = "0px 0px 0px";
};

document.body.onclick = function(ev){
  window.parent.postMessage(curXpath, "*");
  ev.preventDefault();
  ev.stopPropagation();
};