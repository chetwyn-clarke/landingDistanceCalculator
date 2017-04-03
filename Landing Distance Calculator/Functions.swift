//
//  Functions.swift
//  Landing Distance Calculator
//
//  Created by Chetwyn on 3/18/17.
//  Copyright © 2017 Clarke Enterprises. All rights reserved.
//

import Foundation

//func determineRunwayConditionIndex (currentRunwayCondition runwayCondition: String) -> Int {
//    
//    if runwayCondition == "Dry" {
//        runwayConditionIndex = 0
//    } else if runwayCondition == "Good" {
//        runwayConditionIndex = 1
//    } else if runwayCondition == "Good to Medium" {
//        runwayConditionIndex = 2
//    } else if runwayCondition == "Medium" {
//        runwayConditionIndex = 3
//    } else if runwayCondition == "Medium to Poor" {
//        runwayConditionIndex = 4
//    } else if runwayCondition == "Poor" {
//        runwayConditionIndex = 5
//    }
//    
//    print("Runway condition Index: \(runwayConditionIndex)")
//    
//    return runwayConditionIndex
//    
//}
//
//func determineBrakingConfigurationIndex (currentBrakingConfiguration brakingConfiguration: String) -> Int {
//    
//    if brakingConfiguration == "Max Manual" {
//        brakingConfigurationIndex = 0
//    } else if brakingConfiguration == "Autobrake MAX" {
//        brakingConfigurationIndex = 1
//    } else if brakingConfiguration == "Autobrake 3" {
//        brakingConfigurationIndex = 2
//    } else if brakingConfiguration == "Autobrake 2" {
//        brakingConfigurationIndex = 3
//    } else if brakingConfiguration == "Autobrake 1" {
//        brakingConfigurationIndex = 4
//    }
//    
//    print("Brake configuration index: \(brakingConfigurationIndex)")
//    
//    return brakingConfigurationIndex
//    
//}
//
//func determineReferenceDistance () -> Double {
//    
//    let referenceDistance: Double = self.referenceDistance[runwayConditionIndex][brakingConfigurationIndex]
//    
//    print("Reference Distance: \(referenceDistance)")
//    
//    return referenceDistance
//    
//}
//
//func calculateWeightAdjustment (aircraftWeight: Double) -> Double {
//    
//    //aircraftWeight is entered via UI
//    
//    // First, determine if aircraft weight is equal to reference weight.  If yes, then there is no adjustment to be made.  If not, then go to step two.
//    
//    var weightAdjustment: Double
//    
//    let referenceWeight = self.referenceWeight
//    
//    if aircraftWeight == referenceWeight {
//        
//        weightAdjustment = 0
//        
//    } else {
//        
//        var weightAdjustmentFactors = [[Double]]()
//        
//        if aircraftWeight > referenceWeight {
//            
//            weightAdjustmentFactors = self.weightAdjustmentAboveRefWeight
//            
//        } else if aircraftWeight < referenceWeight {
//            
//            weightAdjustmentFactors = self.weightAdjustmentBelowRefWeight
//            
//        }
//        
//        //Select the correct weight adjustment factor.
//        
//        let adjustment_Factor_Per_10000_Pounds = weightAdjustmentFactors[runwayConditionIndex][brakingConfigurationIndex]
//        
//        let adjustment_Factor_Per_Pound = adjustment_Factor_Per_10000_Pounds / 10000
//        
//        //Determine the weight adjustment
//        
//        let weightDifference = abs(aircraftWeight - referenceWeight)
//        
//        weightAdjustment = adjustment_Factor_Per_Pound * weightDifference
//        
//    }
//    
//    print("Weight adjustment: \(round(weightAdjustment))")
//    
//    return weightAdjustment
//    
//}
//
//func calculateAltitudeAdjustment (airportAltitude: Int) -> Double {
//    
//    let altitude = Double(airportAltitude)
//    
//    var altitudeAdjustment: Double
//    
//    var altitude_Adjustment_Per_Foot: Double
//    
//    if altitude <= 8000 {
//        
//        altitude_Adjustment_Per_Foot = (self.altitudeAdjustmentStandard[runwayConditionIndex][brakingConfigurationIndex]) / 1000
//        
//        altitudeAdjustment = altitude * altitude_Adjustment_Per_Foot
//        
//    } else {
//        
//        altitude_Adjustment_Per_Foot = (self.altitudeAdjustmentHigh[runwayConditionIndex][brakingConfigurationIndex]) / 1000
//        
//        altitudeAdjustment = (self.altitudeAdjustmentStandard[runwayConditionIndex][brakingConfigurationIndex] * 8) + ((altitude - 8000) * altitude_Adjustment_Per_Foot)
//    }
//    
//    print("Altitude adjustment: \(altitudeAdjustment)")
//    
//    return altitudeAdjustment
//    
//}
//
//func calculateWindAdjustment (runway: Int, windDirection: Int, windSpeed: Int) -> Double {
//    
//    var wind_Adjustment_Per_10_Knots: Double
//    
//    var wind_Adjustment_Per_Knot: Double
//    
//    var windAdjustment: Double = 0
//    
//    var headwind: Double = 0
//    
//    var tailwind: Double = 0
//    
//    func calculateWindComponents() -> (headwind: Double, tailwind: Double)  {
//        
//        let runwayHeading = runway * 10
//        
//        let windAngle = abs(windDirection - runwayHeading)
//        
//        let windAngleInRadians = Double(windAngle) * 0.01745
//        
//        //Alternative is to create a nested function to find the most precise radians value.
//        
//        let parallelWind = abs(cos(windAngleInRadians) * Double(windSpeed))
//        
//        if windAngle == 90 || windAngle == 270 {
//            //No headwind or tailwind
//        } else if windAngle < 90 || windAngle > 270 {
//            //Dealing with a headwind
//            headwind = floor(parallelWind)
//            
//        } else {
//            //Dealing with a tailwind
//            tailwind = ceil(parallelWind)
//            
//        }
//        
//        /*
//         Code for using precise values which I will then need to round for output to the user.  If I use precise values for the calculations, add a 500 foot buffer at the end of all calculations.
//         
//         if windAngle == 90 || windAngle == 270 {
//         
//         //Do nothing since there is no headwind or tailwind
//         
//         } else if windAngle < 90 || windAngle > 270 {
//         
//         //Dealing with a headwind
//         
//         headwind = parallelWind
//         
//         } else {
//         
//         //Dealing with a tailwind
//         
//         tailwind = parallelWind
//         
//         }
//         
//         */
//        
//        // let crosswind = abs(sin(windAngleInRadians) * Double(windSpeed))
//        
//        print("Headwind: \(headwind)), tailwind \(tailwind))")
//        
//        return (headwind, tailwind)
//        
//    }
//    
//    if headwind == 0 && tailwind == 0 {
//        
//        windAdjustment = 0
//        
//    } else if headwind != 0 {
//        
//        wind_Adjustment_Per_10_Knots = self.windAdjustmentForHeadwind[runwayConditionIndex][brakingConfigurationIndex]
//        
//        wind_Adjustment_Per_Knot = wind_Adjustment_Per_10_Knots / 10
//        
//        windAdjustment = wind_Adjustment_Per_Knot * headwind
//        
//    } else if tailwind != 0 {
//        
//        wind_Adjustment_Per_10_Knots = self.windAdjustmentForTailwind[runwayConditionIndex][brakingConfigurationIndex]
//        
//        wind_Adjustment_Per_Knot = wind_Adjustment_Per_10_Knots / 10
//        
//        windAdjustment = wind_Adjustment_Per_Knot * tailwind
//        
//    }
//    
//    return windAdjustment
//    
//}
//
//func calculateSlopeAdjustment(runwaySlope: Double = -2.0) -> Double {
//    
//    var slope_Adjustment_Per_Percent_Downhill: Double
//    
//    var slope_Adjustment_Per_Percent_Uphill: Double
//    
//    var slopeAdjustment: Double = 0
//    
//    if runwaySlope > 0 {
//        
//        slope_Adjustment_Per_Percent_Uphill = self.slopeAdjustmentUphill[runwayConditionIndex][brakingConfigurationIndex] * runwaySlope
//        
//        slopeAdjustment = slope_Adjustment_Per_Percent_Uphill * runwaySlope
//        
//    } else if runwaySlope < 0 {
//        
//        slope_Adjustment_Per_Percent_Downhill = self.slopeAdjustmentDownhill[runwayConditionIndex][brakingConfigurationIndex] * runwaySlope
//        
//        slopeAdjustment = slope_Adjustment_Per_Percent_Downhill * runwaySlope
//        
//    } else {
//        
//        //Do nothing and slopeAdjustment will be 0
//        
//    }
//    
//    print("Slope adjustment: \(round(slopeAdjustment))")
//    
//    return slopeAdjustment
//    
//}
//
//func calculateTemperatureAdjustment (airportelevation: Int, airportTemperature: Int) -> Double {
//    
//    var temperatureAdjustment: Double = 0
//    
//    let temperature = Double(airportTemperature)
//    
//    var isa_Temperature_At_Airfield: Double = 0
//    
//    func calculateISATemperature () -> Double {
//        
//        let lapseRatePerFoot = (2.00 / 1000)
//        //Most accurate lapse rate is 1.98 / 1000
//        isa_Temperature_At_Airfield = 15 - (Double(airportelevation) * lapseRatePerFoot)
//        
//        return isa_Temperature_At_Airfield
//        
//    }
//    
//    let temperatureDifference = temperature - isa_Temperature_At_Airfield
//    
//    var temperature_Adjustment_Per_Degree: Double = 0
//    
//    if temperatureDifference > 0 {
//        
//        temperature_Adjustment_Per_Degree = self.temperatureAdjustmentAboveISA[runwayConditionIndex][brakingConfigurationIndex] / 10
//        
//        temperatureAdjustment = abs(temperatureDifference) * temperature_Adjustment_Per_Degree
//        
//    } else if temperatureDifference < 0 {
//        
//        temperature_Adjustment_Per_Degree = self.temperatureAdjustmentBelowISA[runwayConditionIndex][brakingConfigurationIndex] / 10
//        
//        temperatureAdjustment = abs(temperatureDifference) * temperature_Adjustment_Per_Degree
//        
//    } else {
//        
//        //Do nothing.  Temperature adjustment initialised to 0
//        
//    }
//    
//    print("Temperature Adjustment: \(round(temperatureAdjustment))")
//    
//    return temperatureAdjustment
//    
//}
//
//func calculateApproachSpeedAdjustment(adjustmentToRefSpeed: Int) -> Double {
//    
//    let adjustmentToRef = Double(adjustmentToRefSpeed)
//    
//    let adjustment_Per_Knot_Above_Ref: Double = self.approachSpeedAdjustmentAboveVref[runwayConditionIndex][brakingConfigurationIndex] / 5
//    
//    let approachSpeedAdjustment = adjustmentToRef * adjustment_Per_Knot_Above_Ref
//    
//    print("Approach Speed Adjustment: \(round(approachSpeedAdjustment))")
//    
//    return approachSpeedAdjustment
//    
//}
//
//func calculateReverseThrustAdjustment (reversersAvailable: Int) -> Double {
//    
//    var reverseThrustAdjustment: Double = 0
//    
//    if reversersAvailable == 0 {
//        
//        reverseThrustAdjustment = self.reverseThrustAdjustmentNoReversers[runwayConditionIndex][brakingConfigurationIndex]
//        
//    } else if reversersAvailable == 1 {
//        
//        reverseThrustAdjustment = self.reverseThrustAdjustmentOneReverser[runwayConditionIndex][brakingConfigurationIndex]
//        
//    }
//    
//    print("Reverse thrust adjustment: \(reverseThrustAdjustment)")
//    
//    return reverseThrustAdjustment
//    
//}
