//jquery scraping for 
// http://www.rabbitadoption.org/adoptapetca.html
String.prototype.trim = function () {
    return this.replace(/^\s*/, "").replace(/\s*$/, "");
};

String.prototype.capFirst = function(){
  return this.charAt(0).toUpperCase() + this.slice(1);
}


list = [];
var phone_regex = /(\d+)-(\d+)-(\d+)/g;
var newline_regex = /^[\r\n]+|\.|[\r\n]+$/g;
var nl_regex = /\n/g;
var carridge_regex = /\n/g;
var zip_regex = /\d{5}(-\d{4})?/g;
var email_re = new RegExp(/([a-zA-Z0-9_\-\.+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/igm);
var url_regex = /((ftp|http|https):\/\/)?(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/g;

var scrapers = {
  phone:[
  "$row.find('h2').text().match(phone_regex)[0].trim()",
  "$row.find('p:first').text().match(phone_regex)[0].trim()"
  ]
  ,name: [
  "$row.find('h2').text().replace(phone_regex, '').trim().split(nl_regex)[0].trim()",
  "$row.find('p:first').text().replace(phone_regex, '').trim().split(nl_regex)[0].trim()"
  ]
  ,address: [
    "$row.find('td').children().eq(1).text().trim().replace(' * ', ', ').replace(nl_regex, '').replace(carridge_regex, '').replace('   ', '');",
    "$row.find('td').children().eq(2).text().trim().replace(' * ', ', ').replace(nl_regex, '').replace(carridge_regex, '').replace('   ', '');"        
  ]
  ,email:["$row.text().match(email_re)[0]"]
  ,website:["$row.text().match(url_regex)[0]"]
  ,county: ["$row.parents('table').prevAll('p:eq(0)').find('a').text().split('COUNTY')[0].trim()"]
  ,url: ["$row.text().match(url_regex)"]
};


for(var scraper in scrapers){
  if(typeof window["parse"+scraper.capFirst()] != "function"){
    eval("function parse"+scraper.capFirst()+"($row){ var ret; try{ ret = "+scrapers[scraper][0]+"; }catch(ex){ console.log('could not find "+scraper+" for ', $row, ex); }return ret;}");
  }
}

$('table.MsoNormalTable tr').each(function(){
  var $row = $(this);

  var address = parseAddress($row),

  address_chunks = address.split(',');

  try{
    var zip = address.match(zip_regex)[0];
    var street = address_chunks[0].replace(/\s+/, ' ');
    var state = "CA";
    var city = address_chunks[1].trim().split(zip_regex)[0].trim();
  }catch(ex){
    console.log("couldn't break down address for", $row, ex);    
  }

  list.push({
    name: parseName($row),
    phone: parsePhone($row),
    county: parseCounty($row),
    city: city,
    //address: address,
    line1: street,
    state: state,
    zip: zip,
    email: parseEmail($row),
    //row: $row,
    url: (function(){
      try{
        var urlmatches = parseUrl($row);
        return urlmatches[urlmatches.length-1];
      }catch(ex){
        console.log("couldnt get url matches for", $row, ex);
      }
    })()
  });
});

console.log(list);
//console.log(JSON.stringify(list));