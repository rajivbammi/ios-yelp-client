//
//  Filters.swift
//  Yelp
//
//  Created by Rajiv B on 9/21/15.
//  Copyright (c) 2015 Rajiv B. All rights reserved.
//

class Option {
    var label: String
    var name: String?
    var value: String
    var selected: Bool
    
    init(label: String, name: String? = nil, value: String, selected: Bool = false) {
        self.label = label
        self.name = name
        self.value = value
        self.selected = selected
    }
    
}

enum FilterType {
    case Default, Single, Multiple
}

class FilterList {
    var filters = [
        Filter(
            label: "Popular",
            options: [
                Option(label: "Offering a Deal", name: "deals_filter", value: "1")
            ],
            type: .Default,
            numItemsVisible: 1
        ),
        
        Filter(
            label: "Categories",
            name: "category_filter",
            options: [
                Option(label: "", value: ""),
                Option(label: "Afghan", value: "afghani"),
                Option(label: "African", value: "african"),
                Option(label: "American, New", value: "newamerican"),
                Option(label: "American, Traditional", value: "tradamerican"),
                Option(label: "Arabian", value: "arabian"),
                Option(label: "Argentine", value: "argentine"),
                Option(label: "Armenian", value: "armenian"),
                Option(label: "Asian Fusion", value: "asianfusion"),
                Option(label: "Australian", value: "australian"),
                Option(label: "Austrian", value: "austrian"),
                Option(label: "Bangladeshi", value: "bangladeshi"),
                Option(label: "Barbeque", value: "bbq"),
                Option(label: "Basque", value: "basque"),
                Option(label: "Belgian", value: "belgian"),
                Option(label: "Brasseries", value: "brasseries"),
                Option(label: "Brazilian", value: "brazilian"),
                Option(label: "Breakfast & Brunch", value: "breakfast_brunch"),
                Option(label: "British", value: "british"),
                Option(label: "Buffets", value: "buffets"),
                Option(label: "Burgers", value: "burgers"),
                Option(label: "Burmese", value: "burmese"),
                Option(label: "Cafes", value: "cafes"),
                Option(label: "Cafeteria", value: "cafeteria"),
                Option(label: "Cajun/Creole", value: "cajun"),
                Option(label: "Cambodian", value: "cambodian"),
                Option(label: "Caribbean", value: "caribbean"),
                Option(label: "Catalan", value: "catalan"),
                Option(label: "Cheesesteaks", value: "cheesesteaks"),
                Option(label: "Chicken Wings", value: "chicken_wings"),
                Option(label: "Chinese", value: "chinese"),
                Option(label: "Comfort Food", value: "comfortfood"),
                Option(label: "Creperies", value: "creperies"),
                Option(label: "Cuban", value: "cuban"),
                Option(label: "Czech", value: "czech"),
                Option(label: "Delis", value: "delis"),
                Option(label: "Diners", value: "diners"),
                Option(label: "Ethiopian", value: "ethiopian"),
                Option(label: "Fast Food", value: "hotdogs"),
                Option(label: "Filipino", value: "filipino"),
                Option(label: "Fish & Chips", value: "fishnchips"),
                Option(label: "Fondue", value: "fondue"),
                Option(label: "Food Court", value: "food_court"),
                Option(label: "Food Stands", value: "foodstands"),
                Option(label: "French", value: "french"),
                Option(label: "Gastropubs", value: "gastropubs"),
                Option(label: "German", value: "german"),
                Option(label: "Gluten-Free", value: "gluten_free"),
                Option(label: "Greek", value: "greek"),
                Option(label: "Halal", value: "halal"),
                Option(label: "Hawaiian", value: "hawaiian"),
                Option(label: "Himalayan/Nepalese", value: "himalayan"),
                Option(label: "Hot Dogs", value: "hotdog"),
                Option(label: "Hot Pot", value: "hotpot"),
                Option(label: "Hungarian", value: "hungarian"),
                Option(label: "Iberian", value: "iberian"),
                Option(label: "Indian", value: "indpak"),
                Option(label: "Indonesian", value: "indonesian"),
                Option(label: "Irish", value: "irish"),
                Option(label: "Italian", value: "italian"),
                Option(label: "Japanese", value: "japanese"),
                Option(label: "Korean", value: "korean"),
                Option(label: "Kosher", value: "kosher"),
                Option(label: "Laotian", value: "laotian"),
                Option(label: "Latin American", value: "latin"),
                Option(label: "Live/Raw Food", value: "raw_food"),
                Option(label: "Malaysian", value: "malaysian"),
                Option(label: "Mediterranean", value: "mediterranean"),
                Option(label: "Mexican", value: "mexican"),
                Option(label: "Middle Eastern", value: "mideastern"),
                Option(label: "Modern European", value: "modern_european"),
                Option(label: "Mongolian", value: "mongolian"),
                Option(label: "Moroccan", value: "moroccan"),
                Option(label: "Pakistani", value: "pakistani"),
                Option(label: "Persian/Iranian", value: "persian"),
                Option(label: "Peruvian", value: "peruvian"),
                Option(label: "Pizza", value: "pizza"),
                Option(label: "Polish", value: "polish"),
                Option(label: "Portuguese", value: "portuguese"),
                Option(label: "Russian", value: "russian"),
                Option(label: "Salad", value: "salad"),
                Option(label: "Sandwiches", value: "sandwiches"),
                Option(label: "Scandinavian", value: "scandinavian"),
                Option(label: "Scottish", value: "scottish"),
                Option(label: "Seafood", value: "seafood"),
                Option(label: "Singaporean", value: "singaporean"),
                Option(label: "Slovakian", value: "slovakian"),
                Option(label: "Soul Food", value: "soulfood"),
                Option(label: "Soup", value: "soup"),
                Option(label: "Southern", value: "southern"),
                Option(label: "Spanish", value: "spanish"),
                Option(label: "Steakhouses", value: "steak"),
                Option(label: "Sushi Bars", value: "sushi"),
                Option(label: "Taiwanese", value: "taiwanese"),
                Option(label: "Tapas Bars", value: "tapas"),
                Option(label: "Tapas/Small Plates", value: "tapasmallplates"),
                Option(label: "Tex-Mex", value: "tex-mex"),
                Option(label: "Thai", value: "thai"),
                Option(label: "Turkish", value: "turkish"),
                Option(label: "Ukrainian", value: "ukrainian"),
                Option(label: "Uzbek", value: "uzbek"),
                Option(label: "Vegan", value: "vegan"),
                Option(label: "Vegetarian", value: "vegetarian"),
                Option(label: "Vietnamese", value: "vietnamese")
            ],
            type: .Multiple,
            numItemsVisible: 4
        )
    ]
    
    init(objInstance: FilterList? = nil) {
    }
    
    class var instance: FilterList {
        struct Static {
            static let instance: FilterList = FilterList()
        }
        return Static.instance
    }
    
    func createSelectionCopy(instance: FilterList) {
        for var filter = 0; filter < self.filters.count; filter++ {
            for var option = 0; option < self.filters[filter].options.count; option++ {
                self.filters[filter].options[option].selected = instance.filters[filter].options[option].selected
            }
        }
    }
    
    func getParameters () -> Dictionary<String, String> {
        var parameters = Dictionary<String, String>()
        for filter in self.filters {
            switch filter.type {
            case .Multiple:
                if filter.name != nil {
                    let selectedOptions = filter.selectedOptions
                    if selectedOptions.count > 0 {
                        parameters[filter.name!] = ",".join(selectedOptions.map({ $0.value }))
                    }
                }
            default:
                for option in filter.options {
                    if option.selected && option.name != nil && option.value != "" {
                        parameters[option.name!] = option.value
                    }
                }
            }
        }
        return parameters
    }
}

class Filter {
    var label: String
    var name: String?
    var options: Array<Option>
    var type: FilterType
    var numItemsVisible: Int?
    var opened: Bool = false
    
    init(label: String, name: String? = nil, options: Array<Option>, type: FilterType, numItemsVisible: Int? = 0) {
        self.label = label
        self.name = name
        self.options = options
        self.type = type
        self.numItemsVisible = numItemsVisible
    }
    
    var selectedIndex: Int {
        get {
            for var i = 0; i < self.options.count; i++ {
                if self.options[i].selected {
                    return i
                }
            }
            return -1
        }
        set {
            if self.type == .Single {
                self.options[self.selectedIndex].selected = false
            }
            self.options[newValue].selected = true
        }
    }
    
    var selectedOptions: Array<Option> {
        get {
            var options: Array<Option> = []
            for option in self.options {
                if option.selected {
                    options.append(option)
                }
            }
            return options
        }
    }
    
}
