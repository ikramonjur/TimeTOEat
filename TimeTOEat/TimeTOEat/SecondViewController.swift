//
//  SecondViewController.swift
//  TimeTOEat
//
//  Created by Ikra Monjur on 9/28/18.
//  Copyright © 2018 Ikra Monjur. All rights reserved.
//

import UIKit
import CVCalendar

class SecondViewController: UIViewController, CVCalendarViewDelegate, CVCalendarMenuViewDelegate   {
    
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    
    @IBAction func todayButton(_ sender: Any) {
        self.calendarView.toggleCurrentDayView()
    }
    
    @IBOutlet weak var monthLabel: UILabel!
    
    func presentationMode() -> CalendarMode {
        return .monthView
    }
    
    func firstWeekday() -> Weekday {
        return .sunday
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTitleText()
        monthLabel.text = calendarView.presentedDate.globalDescription
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateTitleText() {
        navigationController?.navigationBar.topItem?.title = calendarView.presentedDate.globalDescription
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        menuView.commitMenuViewUpdate()
        calendarView.commitCalendarViewUpdate()
    }
    
    func presentedDateUpdated(_ date: CVDate) {
        updateTitleText()
    }
}
