//
//  FavouratesVM.swift
//  SportsAppITI
//
//  Created by abdrahman on 23/02/2022.
//

import Foundation

struct FavouratesVM{
    let sportItem: Sport
}


class FavouratesListViewModel{
    var sportsViewModel: [FavouratesVM]
    init(){
        self.sportsViewModel = [FavouratesVM]()
    }
}

extension FavouratesListViewModel{
    
    func sportViewModel(at index: Int) -> FavouratesVM{
        return self.sportsViewModel[index]
    }
}


extension FavouratesVM{
    var id:String{
        return self.sportItem.idSport
    }
    var name: String{
        return self.sportItem.strSport
    }
    var strFormat: String{
        return self.sportItem.strFormat
    }
    
    var strSportThumb:String{
        return self.sportItem.strSportThumb
    }
    
    var strSportIconGreen:String{
        return self.sportItem.strSportIconGreen
    }
    
    
    var description: String{
        return self.sportItem.strSportDescription
    }
}


//struct Sport{
//    var name:String
//    var coffeeName:String
//    var total:Double
//    var size:String
//}
