//
//  LatestResult.swift
//  SportsAppITI
//
//  Created by abdrahman on 28/02/2022.
//

import Foundation


struct LatestResultsVM{
    let latestResultItem: Event
}

class LatestResultsListVM{
    var latestResultsVM: [LatestResultsVM]
    init(){
        self.latestResultsVM = [LatestResultsVM]()
    }
}

extension LatestResultsListVM{
    
    func latestResultsViewModel(at index: Int) -> LatestResultsVM{
        return self.latestResultsVM[index]
    }
}


extension LatestResultsVM{
    
    var eventId:String{
        return self.latestResultItem.idEvent ?? ""
    }
    var homeTeam: String{
        return self.latestResultItem.strHomeTeam ?? ""
    }
    var awayTeam: String{
        return self.latestResultItem.strAwayTeam ?? ""
    }
    
    var intHomeScore:String{
        return self.latestResultItem.intHomeScore ?? ""
    }
    
    var intAwayScore:String{
        return self.latestResultItem.intAwayScore ?? ""
    }
    
    var eventDate:String{
        return self.latestResultItem.dateEvent ?? ""
    }
    
    var eventTime:String{
        return self.latestResultItem.strTime ?? ""
    }
    
}
