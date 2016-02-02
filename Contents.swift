//: Playground - noun: a place where people can play
//: @Author: Christopher Rijos
//: Description: Appstore Playground

import UIKit
import Foundation

class App {
    
    var app_name: String
    var app_price: Double
    
    init(app_name: String, app_price: Double){
        self.app_name = app_name
        self.app_price = app_price
    }
}

class Developer {
    
    //initializes the dev id to a random integer of 32 bits
    var dev_id: Int32
    var apps: [App]
    var submitted_apps: Int
    var total_sales: Double
    
    //default initializer for dev id
    init() {
        self.dev_id = (rand()%1000) + 1000
        self.apps = [App]()
        self.submitted_apps = 0
        self.total_sales = 0
    }
    func transfer_app(send_App: App, rec_dev: Developer) -> (){
        rec_dev.apps.append(send_App)
    }
    func create_app(name: String, app_price: Double) -> () {
        let a: App = App(app_name: name, app_price: app_price)
        self.apps.append(a)
    }
    func submit_app(sub_App: App, store: AppStore) {
        store.developers.append(self)
        store.apps.append(sub_App)
    }
    func get_dev_stats(_dev: Developer){
        for i in _dev.apps {
            total_sales += i.app_price
        }
        print("Total Sales: \(total_sales)")
    }
}

class AppStore {
    
    var developers: [Developer]
    var apps: [App]
    var total_sales: Double
    
    init(){
        self.developers = [Developer]()
        self.apps = [App]()
        self.total_sales = 0
    }
    func sell_apps() -> () {
        for i in apps{
            total_sales += i.app_price
        }
    }
    func new_dev() -> Developer{
        let a: Developer = Developer()
        developers.append(a)
        return a
    }
    func get_dev_stats() -> Int{
        print("Amount of developers\(developers.count)")
    }
    func store_stats() -> () {
        for i in apps {
            print("App Name: \(i.app_name)")
        }
        print("Total Sales $\(total_sales)")
        print("Copies Sold: \(apps.count)")
    }
}

//declares app store
var store:AppStore = AppStore()

//Create Developers
var dev1:Developer = store.new_dev()
var dev2:Developer = store.new_dev()
var dev3:Developer = store.new_dev()
var dev4:Developer = store.new_dev()

// Create apps for each developer

dev1.create_app("My First App", app_price: 1.50)
dev2.create_app("My Cool App", app_price: 1.75)
dev2.create_app("My Even Cooler App", app_price: 1.99)
dev3.create_app("My Great App", app_price: 2.00)
dev3.create_app("My Even Greater App", app_price: 2.50)
dev3.create_app("My Greatest App", app_price: 2.75)
dev4.create_app("My Awesome App", app_price: 0.00)

//test dev ids
dev1.dev_id
dev2.dev_id
dev3.dev_id
dev4.dev_id

//transfer apps
dev1.transfer_app(dev1.apps[0], rec_dev: <#T##Developer#>)
dev2.transfer_app(dev2.apps[0], rec_dev: <#T##Developer#>)

//submit_apps
dev1.submit_app(dev1.apps[0], store: <#T##AppStore#>)
dev2.submit_app(dev2.apps[0], store: <#T##AppStore#>)
dev2.submit_app(dev2.apps[1], store: <#T##AppStore#>)


//sell some apps
store.sell_apps()

//store stats
store.store_stats()

//Developer profit
store.get_dev_stats()

