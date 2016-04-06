# safeparse
A collection of Haxe static extensions that safely read from XML and JSON, reducing boilerplate

### usage

You have some xml:
```haxe
var data:Xml = getSomeXMLSomehow();
```

You do this a lot:
```haxe
var name = data.get("name").toLowerCase();  //could be non-existent and throw a parse error!
```

...but typing either of these all the time is a pain:
```haxe
var name = "";
if(data.exists("name"))
{
  name = data.get("name").toLowerCase();
}
```
```haxe
var name = (data.exists("name") ? data.exists("name") : "").toLowerCase();
```

It's even more annoying if you want to parse to something other than a string:
```haxe
var number = Std.parseFloat(data.get("number")); //could be non-existent and error,
                                                 //or parsing something like "hamburger" and is now NaN!
```

Now you just add this ```using``` declaration:
```haxe
using safeparse.XMLHelper;
```

And then you can do stuff like this:
```haxe
var name = data.getStr("name", "", LOWER);
var number = data.getFloat("number", 0);
```

If you want to be even simpler you can rely on the defaults:
```haxe
var name = data.getStr("name");        //defaults to "" if non-existent, leaves case alone
var number = data.getFloat("number");  //defaults to 0 if non-existent
```

