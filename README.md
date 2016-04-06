# safeparse
A collection of Haxe static extensions that safely read from XML and JSON, reducing boilerplate

### usage

You have some xml:
```haxe
var data:Xml = getSomeXMLSomehow();
```

You do this a lot:
```haxe
var name = data.att.name.toLowerCase();  //could be non-existent and throw a parse error!
```

...but typing either of these all the time is a pain:
```haxe
var name = "";
if(data.has.name)
{
  name = data.att.name.toLowerCase();
}
```
```haxe
var name = (data.has.name ? data.att.name : "").toLowerCase();
```

Now you just add this ```using``` declaration:
```haxe
using safeparse.XMLHelper;
```

And then you can do this:
```haxe
var name = data.getStr("name", LOWER);
```

