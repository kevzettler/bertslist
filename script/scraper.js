//jquery scraping for http://www.rabbitadoption.org/adoptapetca.html
String.prototype.trim = function () {
    return this.replace(/^\s*/, "").replace(/\s*$/, "");
};


var list = [];
var phone_regex = /(\d+)-(\d+)-(\d+)/g;

var scrapers = {
  name: ["$row.find('h2').text().replace(phone_regex, '').trim()",
   "$row.find('p:first').text().replace(phone_regex, '').trim()"
  ]
}

function parseName($row){
  var name;
  try{
  name = $row.find('h2').text().replace(phone_regex, '').trim() || $row.find('p:first').text().replace(phone_regex, '').trim()
  }catch(ex){
    console.log("could not find name for", $row, ex);
  }
  return name;
}

function parsePhone($row){
  var phone;
  try{
    phone = $row.find('h2').text().match(phone_regex)[0].trim() || $row.find('p:first').text().match(phone_regex)[0].trim()
  }catch(ex){
    console.log("could not find phone for", $row, ex);
  }
  return phone;
}

function parseAddress($row){
  var address;
  try{
    address = $row.find('td').children().eq(1).text().trim();
  }catch(ex){
    console.log("could not find address for", $row, ex);
  }
  return address;
}

$('table.MsoNormalTable tr').each(function(){
  var $row = $(this);
  parseName($row);
  parsePhone($row);

  list.push({
    name: parseName($row),
    phone: parsePhone($row),
    address: parseAddress($row)
  });
});

console.log(list);
