//
//  UpcomingEventsVM.swift
//  SportsAppITI
//
//  Created by abdrahman on 28/02/2022.
//

import Foundation


import Foundation

struct UpcomingEventVM{
    let upcomingEventItem: Event
}


class UpcomingEventListViewModel{
    var upcomingEventsVM: [UpcomingEventVM]
    init(){
        self.upcomingEventsVM = [UpcomingEventVM]()
    }
}

extension UpcomingEventListViewModel{
    
    func upcomingEventsViewModel(at index: Int) -> UpcomingEventVM{
        return self.upcomingEventsVM[index]
    }
}


extension UpcomingEventVM{
    
    var eventId:String{
        return self.upcomingEventItem.idEvent ?? ""
    }
    var eventName: String{
        return self.upcomingEventItem.strEvent ?? ""
    }
    var eventDate: String{
        return self.upcomingEventItem.dateEvent ?? ""
    }
    
    var eventTime:String{
        return self.upcomingEventItem.strTime ?? ""
    }
    
}
