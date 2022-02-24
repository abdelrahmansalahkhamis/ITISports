//
//  SportsVM.swift
//  SportsAppITI
//
//  Created by abdrahman on 23/02/2022.
//

import Foundation

struct SportsVM{
    let sportItem: Sport
}


class SportsListViewModel{
    var sportsViewModel: [SportsVM]
    init(){
        self.sportsViewModel = [SportsVM]()
    }
}

extension SportsListViewModel{
    
    func sportViewModel(at index: Int) -> SportsVM{
        return self.sportsViewModel[index]
    }
}


extension SportsVM{
    
    var id:String{
        return self.sportItem.idSport
    }
    var name: String{
        return self.sportItem.strSport
    }
    var strFormat: StrFormat{
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

