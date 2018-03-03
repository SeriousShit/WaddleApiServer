import App

/// We have isolated all of our App's logic into
/// the App module because it makes our app
/// more testable.
///
/// In general, the executable portion of our App
/// shouldn't include much more code than is presented
/// here.
///
/// We simply initialize our Droplet, optionally
/// passing in values if necessary
/// Then, we pass it to our App's setup function
/// this should setup all the routes and special
/// features of our app
///
/// .run() runs the Droplet's commands, 
/// if no command is given, it will default to "serve"

print("hallo welt")

let config = try Config()

print("master: "    + (config["postgresql", "hostname"]?.string)!)
print("user: "      + (config["postgresql", "user"]?.string)!)
print("password: "  + (config["postgresql", "password"]?.string)!)
print("database: "  + (config["postgresql", "database"]?.string)!)
print("port: "      + (config["postgresql", "port"]?.string)!)

try config.setup()
let drop = try Droplet(config)

try drop.setup()

try drop.run()
