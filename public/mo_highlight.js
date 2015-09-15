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
  ev.target.style.outline = "#0000FF dotted 2px";
  curXpath = getPathTo(ev.target);
};

document.body.onmouseout= function(ev){
  ev.target.style.outline = "0px"
};

document.body.onclick = function(ev){
  //window.parent.postMessage(curXpath, "*");
  ev.preventDefault();
  ev.stopPropagation();

  //console.log(ev.target.tagName);
  console.log(ev.target.classList);
  console.log(ev.target.attributes);
  //var el_attrs = ev.target.attributes;
  var el_attrs = jQuery.extend(true, {}, ev.target.attributes);

  //var parent_location = window.parent.document.location;
  window.parent.postMessage({
    element: ev.target.outerHTML,
    element_tag: ev.target.tagName,
    element_id: ev.target.id,
    element_classes: ev.target.className,
    element_attrs: el_attrs},
    //doc_host: parent_location.hostname,
    //doc_path: parent_location.pathname},
      "http://wiggle-beta.herokuapp.com");
};