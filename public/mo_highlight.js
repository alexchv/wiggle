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

  console.log(ev.target.classList);
  console.log(ev.target.attributes);

  var el_attrs_nm = ev.target.attributes;
  var seacrhed_attrs = ['src', 'name', 'href', 'title'];
  var jq_selector = null;

  seacrhed_attrs.forEach(function(attr) {
    var attr_value = el_attrs_nm.getNamedItem(attr);

    console.log(attr);
    console.log(attr_value);

    if (attr_value && !jq_selector) {
      jq_selector = ["[", attr, "=", "'", attr_value.value, "'", "]"].join('');
    }
  });

  //var parent_location = window.parent.document.location;
  window.parent.postMessage({
    element: ev.target.outerHTML,
    element_tag: ev.target.tagName,
    element_id: ev.target.id,
    element_classes: ev.target.className,
    element_jq_selector: jq_selector},
    //doc_host: parent_location.hostname,
    //doc_path: parent_location.pathname},
      "http://wiggle-beta.herokuapp.com");
};