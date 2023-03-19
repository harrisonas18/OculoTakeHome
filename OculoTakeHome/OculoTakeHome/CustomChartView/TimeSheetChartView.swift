//
//  TimeSheetChartView.swift
//  OculoTakeHome
//
//  Created by Harrison Senesac on 3/17/23.
//

import Charts
import SwiftUI

struct TimeSheetChartView: View {

    var data: [(category: String, clockIn: Date, clockOut: Date)]
    var startOfOpeningHours: Date
    var endOfOpeningsHours: Date
    var weekStart: Date
    var weekEnd: Date
    
    var body: some View {
        
        EventChart(headerTitle: "Day total: \(DataHelpers.getEventsTotalDuration(data))",
                   events: data,
                   chartXScaleRangeStart: startOfOpeningHours,
                   chartXScaleRangeEnd: endOfOpeningsHours)

    }

    static let colors: [String: Color] = [
        "Sleep": Colors.sleepCellChartData,
        "Activity": Colors.activityCellChartData,
        "Caffeine": Colors.caffeineCellChartData,
        "Other": .green
    ]
    
}

struct EventChart: View {
    @State private var selectedEvent: (category: String, clockIn: Date, clockOut: Date)?
    @State private var plotWidth: CGFloat = 0

    var headerTitle: String
    var events: [(category: String, clockIn: Date, clockOut: Date)]
    var chartXScaleRangeStart: Date
    var chartXScaleRangeEnd: Date

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
//            Text(headerTitle)
//                .font(.title3.bold())

            Chart {
                ForEach(events, id: \.clockIn) { event in
                    Plot {
                        BarMark(
                            xStart: .value("Clocking In", event.clockIn),
                            xEnd: .value("Clocking Out", event.clockOut),
                            y: .value("Category", event.category)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .foregroundStyle(getForegroundColor(category: event.category))
                        
                        
                        if let selectedEvent, selectedEvent == event {
                            RuleMark(x: .value("Event Middle", getEventMiddle(start: selectedEvent.clockIn, end: selectedEvent.clockOut)))
                                .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
                                .offset(x: (plotWidth / getEventMiddle(start: selectedEvent.clockIn, end: selectedEvent.clockOut))) // Align with middle of bar
                                .annotation(position: .top) {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("Clocked in \(selectedEvent.clockIn.formatted(date: .abbreviated, time: .shortened))")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        
                                        Text("Clocked out \(selectedEvent.clockOut.formatted(date: .abbreviated, time: .shortened))")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        
                                        Text("Duration: \(DataHelpers.getEventsTotalDuration([selectedEvent]))")
                                            .font(.body.bold())
                                            .foregroundColor(.black)
                                    }
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background {
                                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                                            .fill(.white.shadow(.drop(radius: 2)))
                                    }
                                }
                        }
                        
                    }
                    .accessibilityLabel("Department: \(event.category)")
                    .accessibilityValue("Clock in: \(event.clockIn.formatted(date: .abbreviated, time: .standard)), Clock out: \(event.clockOut.formatted(date: .abbreviated, time: .standard))")
                }
            }
            .chartXAxis {
                AxisMarks(values: .automatic) { _ in
                    AxisGridLine(centered: false, stroke: StrokeStyle(dash: [2, 2]))
                      .foregroundStyle(Color.white)
                    AxisValueLabel()
                        .foregroundStyle(Color.white)
                }
            }
            .chartYAxis {
                AxisMarks(values: .automatic) { _ in
                    AxisGridLine(centered: false, stroke: StrokeStyle(lineWidth: 1))
                      .foregroundStyle(Color.white)
                    AxisValueLabel()
                        .foregroundStyle(Color.white)
                }
            }
            .padding(.top, 5)
            .frame(height: Constants.detailChartHeight)
            .chartXScale(domain: chartXScaleRangeStart...chartXScaleRangeEnd)
        }
    }

    private func getEventMiddle(start: Date, end: Date) -> Date {
        Date(timeInterval: (end.timeIntervalSince1970 - start.timeIntervalSince1970) / 2, since: start)
    }

    private func getEventMiddle(start: Date, end: Date) -> CGFloat {
        CGFloat((start.timeIntervalSince1970 + end.timeIntervalSince1970) / 2)
    }

    private func getForegroundColor(category: String) -> AnyGradient {
        if let color = TimeSheetChartView.colors[category] {
            return color.gradient
        }
        return Color.gray.gradient
    }
}

// MARK: - Accessibility

extension TimeSheetChartView: AXChartDescriptorRepresentable {
    func makeChartDescriptor() -> AXChartDescriptor {
        
        let intervals = data.map {
            (department: $0.category,
             duration: $0.clockOut.timeIntervalSince($0.clockIn),
             clockIn: $0.clockIn,
             clockOut: $0.clockOut)
        }
        
        let min = intervals.map(\.duration).min() ?? 0
        let max = intervals.map(\.duration).max() ?? 0

        let xAxis = AXCategoricalDataAxisDescriptor(
            title: "Department",
            categoryOrder: data.map { $0.category }
        )

        let yAxis = AXNumericDataAxisDescriptor(
            title: "Duration",
            range: Double(min)...Double(max),
            gridlinePositions: []
        ) { value in "\(value.durationDescription)" }

        let series = AXDataSeriesDescriptor(
            name: "Timesheet Example",
            isContinuous: false,
            dataPoints: intervals.map {
                .init(x: $0.department,
                      y: $0.duration,
                      label: "Clock in: \($0.clockIn.formatted(date: .omitted, time: .shortened)), Clock out: \($0.clockOut.formatted(date: .omitted, time: .shortened))")
            }
        )

        return AXChartDescriptor(
            title: "Timesheet by department",
            summary: nil,
            xAxis: xAxis,
            yAxis: yAxis,
            additionalAxes: [],
            series: [series]
        )
    }
}

// MARK: - Preview

struct TimeSheetChartView_Previews: PreviewProvider {
    static var previews: some View {
        TimeSheetChartView(data: TimeSheetData.sleep,
                           startOfOpeningHours: date(year: 2022, month: 6, day: 13, hour: 05, minutes: 00),
                           endOfOpeningsHours: date(year: 2022, month: 6, day: 13, hour: 22, minutes: 00),
                           weekStart: date(year: 2022, month: 6, day: 13, hour: 05, minutes: 00),
                           weekEnd: date(year: 2022, month: 6, day: 18, hour: 20, minutes: 00))
    }
}
