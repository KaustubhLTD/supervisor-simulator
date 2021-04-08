import 'package:flutter/material.dart';
import 'package:flutter_application_1/configuration_details.dart';
import 'package:flutter_application_1/kill_sheet_page2.dart';
import 'package:flutter_application_1/kill_sheet_page3.dart';
import 'package:flutter_application_1/kill_sheet_page4.dart';
import 'package:flutter_application_1/mode_selection.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:flutter_application_1/utilities/multilingual_service.dart';
import 'package:intl/intl.dart';
import 'package:mm_initial_data/mmid_dm_wwm_initial_data.dart';

class KillSheet extends StatefulWidget {
//  SelectedMethodRig methodRig;
SelectedConfigurations sc;
  KillSheet(this.sc);
  @override
  _KillSheetState createState() => _KillSheetState(sc);
}

// class SelectedMethodRig{
//      bool isDrillersMethod;
//   bool isSubsea;
 

//   }

class _KillSheetState extends State<KillSheet> {
 SelectedConfigurations sc;
  _KillSheetState(this.sc);

  SelectedMethodRig methodRig = new SelectedMethodRig();
  int selectedPageCounter = 1;
  String date = DateFormat('dd-MMM-yyyy').format(DateTime.now());
  // var ks;
  var current;
  //variables declaration
  double drillpipeOD;
  double drillpipeID;
  double drillpipeLength;
  double hwdpOD;
  double hwdpID;
  double hwdpLength;
  double drillCollarOD;
  double drillCollarID;
  double drillCollarLength;
  double totalLength;
  double casingShoeDepthFromRKB;
  double currentMudWeight;
  double waterDepth;
  double airGap;
  double drillpipeCapacity;
  double hwdpCapacity;
  double drillcollarCapacity;
  double drillpipeVolume;
  double drillcollarVolume;
  double hwdpVolume;
  double totalVolumeDrillString;
  double chokeLineCapacity;
  double chokeLineLength;
  double chokeLineVolume;
  double bitToShoeVolume;
  double drillingPipeInCasingCapacity;
  double drillingPipeInCasingLength;
  double drillingPipeInCasingVolume;
  double drillingPipeInOHCapacity;
  double drillingPipeInOHLength;
  double drillingPipeInOHVolume;
  double hwdpInOHCapacity;
  double hwdpInOHLength;
  double hwdpInOHVolume;
  double drillcollarInOHCapacity;
  double drillcollarInOHLength;
  double drillcollarInOHVolume;
  double totalAnnulusLength;
  double totalAnnulusVolume;
  double riserLength;
  double riserVolume;
  double riserCapacity;

  static const int drillpipe = 0;
  static const int hwdp = 1;
  static const int drillcollar = 2;

  static const int sectionDuplexPump = 0;
  static const int sectionSurfaceLine = 1;
  static const int sectionDrillPipe = 2;
  static const int sectionHwdp = 3;
  static const int sectionDrillCollar = 4;
  static const int sectionDrillBit = 5;
  static const int sectionDrillCollarOH = 6;
  static const int sectionHWDPOH = 7;
  static const int sectionDrillPipeOH = 8;
  static const int sectionDrillPipeCasing = 9;
  static const int sectionChokeLine = 10;
  static const int sectionChoke = 11;

  @override
  void initState() {
       if(sc.selectedField == 'Wait and Weight' && sc.selectedRig == 'Subsea')
      {

       methodRig.isDrillersMethod = false;
       methodRig.isSubsea = true; }
       else if(sc.selectedField == 'Wait and Weight' && sc.selectedRig == 'Surface'){
         methodRig.isDrillersMethod = false;
       methodRig.isSubsea = false; 
       }
        else if(sc.selectedField == "Driller's Method" && sc.selectedRig == 'Surface'){
         methodRig.isDrillersMethod = true;
       methodRig.isSubsea = false; 
       }
        else if(sc.selectedField == "Driller's Method" && sc.selectedRig == 'Subsea'){
         methodRig.isDrillersMethod = true;
       methodRig.isSubsea = true; 
       }


    Units().initialize().then((value) {
      DmWwmInitialData().loadConfigMetaData().then((success) {
        if (DmWwmInitialData().configMetaData == null) {
          print('configMetaData is NULL');
          return;
        }

        DmWwmInitialData()
            .configMetaData
            .configInfo[sc.selectedConfigIndex]
            .loadConfig(
                isDrillersMethod: methodRig.isDrillersMethod,
                isSubsea: methodRig.isSubsea,
                influxType: InfluxType.gas)
            .then((success) {
          var _config = DmWwmInitialData().current.configuration;
          var _sectionInfo = DmWwmInitialData().current.sectionInfo;
          var name = DmWwmInitialData().current.configInfo.name;
          current = DmWwmInitialData().current;

          print('current kill config' + name);

          // drillpipeOD = DmWwmInitialData().current.sectionInfo.sections[drillpipe].outerDiameter.value;

          casingShoeDepthFromRKB = _config.casing.depth.value;
          currentMudWeight = _config.fluids.original.density.value;
          waterDepth = _config.riser.depth.value;
          
          airGap = _config.general.airGap.value;
          drillpipeOD = _config.drillstring[drillpipe].outerDiameter.value;
          drillpipeID = _config.drillstring[drillpipe].innerDiameter.value;
         
          hwdpOD = _config.drillstring[hwdp].outerDiameter.value;
          hwdpID = _config.drillstring[hwdp].innerDiameter.value;
         
          drillCollarOD = _config.drillstring[drillcollar].outerDiameter.value;
          drillCollarID = _config.drillstring[drillcollar].innerDiameter.value;
          

         
          //section
          drillpipeCapacity =
              _sectionInfo.sections[sectionDrillPipe].capacity.value;
           drillpipeLength =  _sectionInfo.sections[sectionDrillPipe].length.value;
          drillpipeVolume =
              _sectionInfo.sections[sectionDrillPipe].volume.value;
          
         
          hwdpCapacity = _sectionInfo.sections[sectionHwdp].capacity.value;
          hwdpVolume = _sectionInfo.sections[sectionHwdp].volume.value;
          hwdpLength = _sectionInfo.sections[sectionHwdp].length.value;
         
          drillcollarCapacity =
              _sectionInfo.sections[sectionDrillCollar].capacity.value;
          drillcollarVolume =
              _sectionInfo.sections[sectionDrillCollar].volume.value;
         drillCollarLength = _sectionInfo.sections[sectionDrillCollar].length.value;
        
           totalLength = drillCollarLength + drillpipeLength + hwdpLength;
         
          totalVolumeDrillString =
              drillpipeVolume + hwdpVolume + drillcollarVolume;

          chokeLineCapacity =
              _sectionInfo.sections[sectionChokeLine].capacity.value;
          chokeLineLength =
              _sectionInfo.sections[sectionChokeLine].length.value;
          chokeLineVolume =
              _sectionInfo.sections[sectionChokeLine].volume.value;

          drillingPipeInCasingCapacity =
              _sectionInfo.sections[sectionDrillPipeCasing].capacity.value;
          drillingPipeInCasingLength =
              _sectionInfo.sections[sectionDrillPipeCasing].length.value;
          drillingPipeInCasingVolume =
              _sectionInfo.sections[sectionDrillPipeCasing].volume.value;

          drillingPipeInOHCapacity =
              _sectionInfo.sections[sectionDrillPipeOH].capacity.value;
          drillingPipeInOHLength =
              _sectionInfo.sections[sectionDrillPipeOH].length.value;
          drillingPipeInOHVolume =
              _sectionInfo.sections[sectionDrillPipeOH].volume.value;

          hwdpInOHCapacity =
              _sectionInfo.sections[sectionHWDPOH].capacity.value;
          hwdpInOHLength = _sectionInfo.sections[sectionHWDPOH].length.value;
          hwdpInOHVolume = _sectionInfo.sections[sectionHWDPOH].volume.value;

          drillcollarInOHCapacity =
              _sectionInfo.sections[sectionDrillCollarOH].capacity.value;
          drillcollarInOHLength =
              _sectionInfo.sections[sectionDrillCollarOH].length.value;
          drillcollarInOHVolume =
              _sectionInfo.sections[sectionDrillCollarOH].volume.value;

        riserLength= _config.riser.length.value;
      
        // riserCapacity =;
        riserVolume = 3.14 *  (_config.riser.outerDiameter.value /  2) *  (_config.riser.outerDiameter.value /  2);
          riserCapacity = riserVolume/riserLength;
          totalAnnulusLength = chokeLineLength +
              drillingPipeInCasingLength +
              drillingPipeInOHLength +
              hwdpInOHLength +
              drillcollarInOHLength;
        
        totalAnnulusVolume = 
          chokeLineVolume+
          drillingPipeInCasingVolume +
              drillingPipeInOHVolume +
              hwdpInOHVolume +
              drillcollarInOHVolume 
             
              ;


          // drillpipeID = _config.drillstring[0].innerDiameter.;value;
          bitToShoeVolume = current.killSheet.bitToShoeVolume.value;

          printConfig();
        });

        setState(() {});
      });
    });
    // TODO: implement initState
    super.initState();
  }

  void printConfig() {
    print('***********START*************');
    var _config = DmWwmInitialData().current.configuration;
    var nameInfo = DmWwmInitialData().current.configInfo.name;
    print(
        'Current Config Name: $nameInfo Sections Count: ${DmWwmInitialData().current.sectionInfo.sections.length}');

    print("** CONFIGURATION DATA **");
    {
      var d = _config.casing;
      print('** name ${d.name} **');
      var v = d.length;
      print(
          '   length ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.depth;
      print(
          '   depth ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.outerDiameter;
      print(
          '   outerDiameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.innerDiameter;
      print(
          '   innerDiameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.yieldStrength;
      print(
          '   yieldStrength ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
    }
    {
      var d = _config.choke;
      print('** name ${d.name} **');
      var v = d.diameter;
      print(
          '   diameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.coefficient;
      print(
          '   coefficient ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
    }
    {
      var d = _config.chokeLine;
      print('** name ${d.name} **');
      var v = d.length;
      print(
          '   length ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.depth;
      print(
          '   depth ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.outerDiameter;
      print(
          '   outerDiameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.innerDiameter;
      print(
          '   innerDiameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
    }
    {
      var d = _config.drillbit;
      print('** name ${d.name} **');
      var v = d.length;
      print(
          '   length ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.width;
      print(
          '   width ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      {
        var v = d.nozzle.coefficient;
        print(
            '     nozzle coefficient ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        d.nozzle.sizeInfo.forEach((element) {
          var v = element.size;
          print(
              '     nozzle size ${v.value} count ${element.count} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        });
      }
    }
    {
      _config.drillstring.forEach((d) {
        print('** name ${d.name} **');
        var v = d.length;
        print(
            '   length ${v.value} count ${d.count} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.outerDiameter;
        print(
            '   outerDiameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.innerDiameter;
        print(
            '   innerDiameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        print('   positionFromBottom ${d.positionFromBottom}');
      });
    }

    {
      {
        var d = _config.fluids.original;
        print('** name ${d.name} ** model ${d.model} **');
        var v = d.mvtrAt600Rpm;
        print(
            '   mvtrAt600Rpm ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.mvtrAt300Rpm;
        print(
            '   mvtrAt300Rpm ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.density;
        print(
            '   density ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.fluids.pumping;
        print('** name ${d.name} ** model ${d.model} **');
        var v = d.mvtrAt600Rpm;
        print(
            '   mvtrAt600Rpm ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.mvtrAt300Rpm;
        print(
            '   mvtrAt300Rpm ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.density;
        print(
            '   density ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
    }
    {
      var d = _config.fracturePressure;
      print('** name ${d.name} **');
      var v = d.fracturePressureGradient;
      print(
          '   fracturePressureGradient ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.lotPressureAtShoe;
      print(
          '   lotPressureAtShoe ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.fitUpperRange;
      print(
          '   fitUpperRange ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.fitLowerRange;
      print(
          '   fitLowerRange ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
    }
    {
      var d = _config.general;
      print('** name ${d.name} ** floatValvePresent ${d.floatValvePresent} **');
      var v = d.airGap;
      print(
          '   airGap ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.formationPressureGradient;
      print(
          '   formationPressureGradient ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.rotaryKellyBushingHeight;
      print(
          '   rotaryKellyBushingHeight ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.macpSafetyFactor;
      print(
          '   macpSafetyFactor ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.recordScrAtInterval;
      print(
          '   recordScrAtInterval ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      {
        var d = _config.general.scrInfo;
        print("** scrInfo **");
        v = d.scr;
        print(
            '   scrInfo scr ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.interval;
        print(
            '   scrInfo interval ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.general.pcMax;
        print("** pcMax **");
        v = d.bhTemperatureGradient;
        print(
            '   bhTemperatureGradient ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.surfaceTemperature;
        print(
            '   surfaceTemperature ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.z2IsToZ1;
        print(
            '   z2IsToZ1 ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
    }
    {
      {
        var d = _config.influxDetailsTypes.gas;
        print('** name ${d.name} ** isCompressible ${d.isCompressible} **');
        var v = d.depth;
        print(
            '   depth ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.viscosity;
        print(
            '   viscosity ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.density;
        print(
            '   density ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.volume;
        print(
            '   volume ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.yieldPoint;
        print(
            '   yieldPoint ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.permeability;
        print(
            '   permeability ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.influxDetailsTypes.oil;
        print('** name ${d.name} ** isCompressible ${d.isCompressible} **');
        var v = d.depth;
        print(
            '   depth ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.viscosity;
        print(
            '   viscosity ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.density;
        print(
            '   density ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.volume;
        print(
            '   volume ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.yieldPoint;
        print(
            '   yieldPoint ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.permeability;
        print(
            '   permeability ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
    }
    {
      {
        var d = _config.initial.timeX;
        print("** initial timeX **");
        var v = d.data;
        print(
            '   timeX data ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.initial.spm;
        print("** initial spm **");
        var v = d.data;
        print(
            '   spm data ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.requestInterval;
        print(
            '   spm requestInterval ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.initial.co;
        print("** initial co **");
        var v = d.data;
        print(
            '   co data ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.initial.chokeSpeed;
        print("** initial chokeSpeed **");
        var v = d.data;
        print(
            '   chokeSpeed data ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.initial.bfv;
        print("** initial bfv **");
        var v = d.pauseForLull;
        print(
            '   bfv pauseForLull ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');

        d.slowdownBeforeLullHappen.forEach((v) {
          print(
              '   bfv slowdownBeforeLullHappen ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        });
      }
      {
        var d = _config.initial.dac;
        print("** initial dac **");
        var v = d.changeRatio;
        print(
            '   dac changeRatio ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.gasVolume;
        print(
            '   dac gasVolume ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.initial.cls;
        print("** initial cls **");
        var v = d.startValue;
        print(
            '   cls startValue ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.changeOnEachOperation;
        print(
            '   cls changeOnEachOperation ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.initial.killProblem;
        print("** initial killProblem **");
        var v = d.triggerProblemAfterStroke;
        print(
            '   killProblem triggerProblemAfterStroke ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');

        v = d.pressureDiffToTriggerProblem;
        print(
            '   killProblem pressureDiffToTriggerProblem ${v.value} Unit: ${v.unit?.notation ?? "NA"}');

        v = d.nozzlePlugging.changeRate;
        print(
            '   killProblem nozzlePlugging changeRate ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.nozzleWashout.changeRate;
        print(
            '   killProblem nozzleWashout changeRate ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.chokePlugging.changeRate;
        print(
            '   killProblem chokePlugging changeRate ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        v = d.chokeWashout.changeRate;
        print(
            '   killProblem chokeWashout changeRate ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.initial.influxInitial;
        print("** initial influxInitial **");
        var v = d.canTake;
        print(
            '   influxInitial canTake ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.initial.margins;
        print("** initial margins**");
        {
          var v = d.cp.general;
          print(
              '   cp general near plus ${v?.near?.plus ?? "NA"} minus ${v?.near?.minus ?? "NA"}');
          print(
              '   cp general buffer plus ${v?.buffer?.plus ?? "NA"} minus ${v?.buffer?.minus ?? "NA"}');
          v = d.cp.shutdown;
          print(
              '   cp shutdown near plus ${v?.near?.plus ?? "NA"} minus ${v?.near?.minus ?? "NA"}');
          print(
              '   cp shutdown buffer plus ${v?.buffer?.plus ?? "NA"} minus ${v?.buffer?.minus ?? "NA"}');
        }
        {
          var v = d.cpIcp.general;
          print(
              '   cpIcp general near plus ${v?.near?.plus ?? "NA"} minus ${v?.near?.minus ?? "NA"}');
          print(
              '   cpIcp general buffer plus ${v?.buffer?.plus ?? "NA"} minus ${v?.buffer?.minus ?? "NA"}');
          v = d.cpIcp.shutdown;
          print(
              '   cpIcp shutdown near plus ${v?.near?.plus ?? "NA"} minus ${v?.near?.minus ?? "NA"}');
          print(
              '   cpIcp shutdown buffer plus ${v?.buffer?.plus ?? "NA"} minus ${v?.buffer?.minus ?? "NA"}');
        }
        {
          var v = d.dpp.general;
          print(
              '   dpp general near plus ${v?.near?.plus ?? "NA"} minus ${v?.near?.minus ?? "NA"}');
          print(
              '   dpp general buffer plus ${v?.buffer?.plus ?? "NA"} minus ${v?.buffer?.minus ?? "NA"}');
          v = d.dpp.shutdown;
          print(
              '   dpp shutdown near plus ${v?.near?.plus ?? "NA"} minus ${v?.near?.minus ?? "NA"}');
          print(
              '   dpp shutdown buffer plus ${v?.buffer?.plus ?? "NA"} minus ${v?.buffer?.minus ?? "NA"}');
        }
        {
          var v = d.dppIcp.general;
          print(
              '   dppIcp general near plus ${v?.near?.plus ?? "NA"} minus ${v?.near?.minus ?? "NA"}');
          print(
              '   dppIcp general buffer plus ${v?.buffer?.plus ?? "NA"} minus ${v?.buffer?.minus ?? "NA"}');
          v = d.dppIcp.shutdown;
          print(
              '   dppIcp shutdown near plus ${v?.near?.plus ?? "NA"} minus ${v?.near?.minus ?? "NA"}');
          print(
              '   dppIcp shutdown buffer plus ${v?.buffer?.plus ?? "NA"} minus ${v?.buffer?.minus ?? "NA"}');
        }
        {
          var v = d.icp.general;
          print(
              '   icp general near plus ${v?.near?.plus ?? "NA"} minus ${v?.near?.minus ?? "NA"}');
          print(
              '   icp general buffer plus ${v?.buffer?.plus ?? "NA"} minus ${v?.buffer?.minus ?? "NA"}');
          v = d.icp.shutdown;
          print(
              '   icp shutdown near plus ${v?.near?.plus ?? "NA"} minus ${v?.near?.minus ?? "NA"}');
          print(
              '   icp shutdown buffer plus ${v?.buffer?.plus ?? "NA"} minus ${v?.buffer?.minus ?? "NA"}');
        }
      }

      print('DacGasVolume: ${_config.initial.dac.gasVolume.range.min ?? "NA"}');
      print('DacGasVolume: ${_config.initial.dac.gasVolume.range.max ?? "NA"}');
    }
    {
      var d = _config.leakOffTests;
      print('** name ${d.name} **');
      var v = d.mudWeight;
      print(
          '   mudWeight ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.surfacePressure;
      print(
          '   surfacePressure ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
    }
    {
      {
        var d = _config.mudMaterials.solid;
        print("** mudMaterials solid **");
        var v = d.specificGravity;
        print(
            '   solid specificGravity ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.mudMaterials.water;
        print("** mudMaterials water **");
        var v = d.specificGravity;
        print(
            '   water specificGravity ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var d = _config.mudMaterials.oil;
        print("** mudMaterials oil **");
        var v = d.specificGravity;
        print(
            '   oil specificGravity ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
    }
    {
      {
        var data = _config.mudTypes.waterBasedMud;
        var d = data.solid;
        print("** mudTypes waterBasedMud **");
        var v = d.fraction;
        print(
            '   mudTypes waterBasedMud solid fraction ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        d = data.water;
        v = d.fraction;
        print(
            '   mudTypes waterBasedMud water fraction ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
      {
        var data = _config.mudTypes.oilBasedMud;
        var d = data.solid;
        print("** mudTypes oilBasedMud **");
        var v = d.fraction;
        print(
            '   mudTypes oilBasedMud solid fraction ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
        d = data.water;
        v = d.fraction;
        print(
            '   mudTypes oilBasedMud water fraction ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      }
    }
    {
      var d = _config.overbalance;
      print("** overbalance **");
      var v = d.c;
      print(
          '   overbalance c ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.k;
      print(
          '   overbalance k ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.a;
      print(
          '   overbalance a ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.u;
      print(
          '   overbalance u ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.l;
      print(
          '   overbalance l ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.differentialPressureBeforeLeak;
      print(
          '   overbalance differentialPressureBeforeLeak ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
    }
    {
      var d = _config.pump;
      print('** name ${d.name} ** type ${d.type}');
      var v = d.linerDiameter;
      print(
          '   linerDiameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.rodDiameter;
      print(
          '   rodDiameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.strokeLength;
      print(
          '   strokeLength ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.efficiency;
      print(
          '   efficiency ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.pumpPopOffPressure;
      print(
          '   pumpPopOffPressure ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
    }
    {
      var d = _config.riser;
      print('** name ${d.name} **');
      var v = d.length;
      print(
          '   length ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.depth;
      print(
          '   depth ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.outerDiameter;
      print(
          '   outerDiameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.innerDiameter;
      print(
          '   innerDiameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
    }
    {
      var d = _config.surfaceLine;
      print('** name ${d.name} **');
      var v = d.length;
      print(
          '   length ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.depth;
      print(
          '   depth ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.outerDiameter;
      print(
          '   outerDiameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.innerDiameter;
      print(
          '   innerDiameter ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
    }
    {
      var d = _config.underbalance;
      print("** underbalance **");
      var v = d.c;
      print(
          '   underbalance c ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.k;
      print(
          '   underbalance k ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.a;
      print(
          '   underbalance a ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.u;
      print(
          '   underbalance u ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.l;
      print(
          '   l ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
      v = d.differentialPressureBeforeInflux;
      print(
          '   underbalance differentialPressureBeforeInflux ${v.value} Unit: ${v.unit?.notation ?? "NA"} Range Min: ${v.range?.min ?? "NA"} Range Max: ${v.range?.max ?? "NA"}');
    }

    print("** ConfigurationData current sectionInfo sections **");
    for (final s in DmWwmInitialData().current.sectionInfo.sections) {
      print("** ${s.name} **");
      print("   name: ${s.name}");
      print(
          "   length: ${s.length?.value ?? "NA"} Unit: ${s.length?.unit?.notation ?? "NA"}");
      print(
          "   depth: ${s.depth?.value ?? "NA"} Unit: ${s.depth?.unit?.notation ?? "NA"}");
      print(
          "   innerDiameter: ${s.innerDiameter?.value ?? "NA"} Unit: ${s.innerDiameter?.unit?.notation ?? "NA"}");
      print(
          "   outerDiameter: ${s.outerDiameter?.value ?? "NA"} Unit: ${s.outerDiameter?.unit?.notation ?? "NA"}");
      print(
          "   odOfDsComponent: ${s.odOfDsComponent?.value ?? "NA"} Unit: ${s.odOfDsComponent?.unit?.notation ?? "NA"}");
      print(
          "   capacity: ${s.capacity?.value ?? "NA"} Unit: ${s.capacity?.unit?.notation ?? "NA"}");
      print(
          "   volume: ${s.volume?.value ?? "NA"} Unit: ${s.volume?.unit?.notation ?? "NA"}");
      print(
          "   top: ${s.top?.value ?? "NA"} Unit: ${s.top?.unit?.notation ?? "NA"}");
    }

    print("========================================================");
    print('=======================KILL SHEET=======================');

    var ks = DmWwmInitialData().current.killSheet;
    print("** Read and Record SCR **");
    ks.recordedPressureForAllScr.forEach((key, value) {
      print(
          '   spm: ${key} | tplOrChokeLine: ${value["tplOrChokeLine"]} | riser: ${value["riser"]} | clf: ${value["clf"]}');
    });
    print(
        'bitToShoeVolume: ${ks.bitToShoeVolume?.value ?? "NA"} ${ks.bitToShoeVolume?.unit?.notation ?? "NA"}');
    print(
        'bitToShoeStrokes: ${ks.bitToShoeStrokes?.value ?? "NA"} ${ks.bitToShoeStrokes?.unit?.notation ?? "NA"}');
    print(
        'bitToShoeTime: ${ks.bitToShoeTime?.value ?? "NA"} ${ks.bitToShoeTime?.unit?.notation ?? "NA"}');
    print(
        'bitToSurfaceVolume: ${ks.bitToSurfaceVolume?.value ?? "NA"} ${ks.bitToSurfaceVolume?.unit?.notation ?? "NA"}');
    print(
        'bitToSurfaceStrokes: ${ks.bitToSurfaceStrokes?.value ?? "NA"} ${ks.bitToSurfaceStrokes?.unit?.notation ?? "NA"}');
    print(
        'bitToSurfaceTime: ${ks.bitToSurfaceTime?.value ?? "NA"} ${ks.bitToSurfaceTime?.unit?.notation ?? "NA"}');
    print('clf: ${ks.clf?.value ?? "NA"} ${ks.clf?.unit?.notation ?? "NA"}');
    print('fp: ${ks.fp?.value ?? "NA"} ${ks.fp?.unit?.notation ?? "NA"}');
    print(
        'fpShoe: ${ks.fpShoe?.value ?? "NA"} ${ks.fpShoe?.unit?.notation ?? "NA"}');
    print(
        'gasMigration.vg: ${ks.gasMigration?.vg?.value ?? "NA"} ${ks.gasMigration?.vg?.unit?.notation ?? "NA"}');
    print(
        'gasMigration.cpMIG: ${ks.gasMigration?.cpMig?.value ?? "NA"} ${ks.gasMigration?.cpMig?.unit?.notation ?? "NA"}');
    print('icp: ${ks.icp?.value ?? "NA"} ${ks.icp?.unit?.notation ?? "NA"}');
    print('iInflux.isCompressible: ${ks.initialInflux.isCompressible}');
    print(
        'iInflux.gradient: ${ks.initialInflux?.gradient?.value ?? "NA"} ${ks.initialInflux?.gradient?.unit?.notation ?? "NA"}');
    print(
        'iInflux.boi: ${ks.initialInflux?.boi?.depth?.value ?? "NA"} ${ks.initialInflux?.boi?.depth?.unit?.notation ?? "NA"}');
    print(
        'iInflux.capacityAtBoi: ${ks.initialInflux?.boi?.capacity?.value ?? "NA"} ${ks.initialInflux?.boi?.capacity?.unit?.notation ?? "NA"}');
    print(
        'iInflux.toi: ${ks.initialInflux?.toi?.depth?.value ?? "NA"} ${ks.initialInflux?.toi?.depth?.unit?.notation ?? "NA"}');
    print(
        'iInflux.capacityAtToi: ${ks.initialInflux?.toi?.capacity?.value ?? "NA"} ${ks.initialInflux?.toi?.capacity?.unit?.notation ?? "NA"}');
    print(
        'iInflux.hp?.hpInDrillstring: ${ks.initialInflux?.hp?.inDs?.value ?? "NA"} ${ks.initialInflux?.hp?.inDs?.unit?.notation ?? "NA"}');
    print(
        'iInflux.hp?.hpInAnnulus: ${ks.initialInflux?.hp?.inAs?.value ?? "NA"} ${ks.initialInflux?.hp?.inAs?.unit?.notation ?? "NA"}');
    print(
        'iInflux.hp?.hpAboveInflux: ${ks.initialInflux?.hp?.aboveInflux?.value ?? "NA"} ${ks.initialInflux?.hp?.aboveInflux?.unit?.notation ?? "NA"}');
    print(
        'iInflux.hp?.hpInInflux: ${ks.initialInflux?.hp?.inInflux?.value ?? "NA"} ${ks.initialInflux?.hp?.inInflux?.unit?.notation ?? "NA"}');
    print(
        'iInflux.hp?.hpBelowInflux: ${ks.initialInflux?.hp?.belowInflux?.value ?? "NA"} ${ks.initialInflux?.hp?.belowInflux?.unit?.notation ?? "NA"}');
    print(
        'influxEnterInWellPressure: ${ks.influxEnterInWellPressure?.value ?? "NA"} ${ks.influxEnterInWellPressure?.unit?.notation ?? "NA"}');
    print(
        'killMud.density: ${ks.killMud?.density?.value ?? "NA"} ${ks.killMud?.density?.unit?.notation ?? "NA"}');
    print(
        'killMud.gradient: ${ks.killMud?.gradient?.value ?? "NA"} ${ks.killMud?.gradient?.unit?.notation ?? "NA"}');
    print(
        'killMud.viscosity: ${ks.killMud?.viscosity?.value ?? "NA"} ${ks.killMud?.viscosity?.unit?.notation ?? "NA"}');
    print(
        'killMud.yieldPoint: ${ks.killMud?.yieldPoint?.value ?? "NA"} ${ks.killMud?.yieldPoint?.unit?.notation ?? "NA"}');
    print('kwm: ${ks.kwm?.value ?? "NA"} ${ks.kwm?.unit?.notation ?? "NA"}');
    print(
        'lagTime: ${ks.lagTime?.value ?? "NA"} ${ks.lagTime?.unit?.notation ?? "NA"}');
    print(
        'leakHappenInWellPressure: ${ks.leakHappenInWellPressure?.value ?? "NA"} ${ks.leakHappenInWellPressure?.unit?.notation ?? "NA"}');
    print(
        'lotPressureAtShoe: ${ks.lotPressureAtShoe?.value ?? "NA"} ${ks.lotPressureAtShoe?.unit?.notation ?? "NA"}');
    print(
        'lotPressureAtTvd: ${ks.lotPressureAtTvd?.value ?? "NA"} ${ks.lotPressureAtTvd?.unit?.notation ?? "NA"}');
    print(
        'lowerFitPressure: ${ks.lowerFitPressure?.value ?? "NA"} ${ks.lowerFitPressure?.unit?.notation ?? "NA"}');
    print(
        'maximumAllowableAnnulusSurfacePressure: ${ks.maximumAllowableAnnulusSurfacePressure?.value ?? "NA"} ${ks.maximumAllowableAnnulusSurfacePressure?.unit?.notation ?? "NA"}');
    print(
        'maximumAllowableAnnulusSurfacePressureUsingKwm: ${ks.maximumAllowableAnnulusSurfacePressureUsingKwm?.value ?? "NA"} ${ks.maximumAllowableAnnulusSurfacePressureUsingKwm?.unit?.notation ?? "NA"}');
    print(
        'maximumAllowableCasingPressure: ${ks.maximumAllowableCasingPressure?.value ?? "NA"} ${ks.maximumAllowableCasingPressure?.unit?.notation ?? "NA"}');
    print(
        'maximumMudWeight: ${ks.maximumMudWeight?.value ?? "NA"} ${ks.maximumMudWeight?.unit?.notation ?? "NA"}');
    print(
        'nozzleArea: ${ks.nozzleArea?.value ?? "NA"} ${ks.nozzleArea?.unit?.notation ?? "NA"}');
    print(
        'originalMud.density: ${ks.originalMud?.density?.value ?? "NA"} ${ks.originalMud?.density?.unit?.notation ?? "NA"}');
    print(
        'originalMud.gradient: ${ks.originalMud?.gradient?.value ?? "NA"} ${ks.originalMud?.gradient?.unit?.notation ?? "NA"}');
    print(
        'originalMud.viscosity: ${ks.originalMud?.viscosity?.value ?? "NA"} ${ks.originalMud?.viscosity?.unit?.notation ?? "NA"}');
    print(
        'originalMud.yieldPoint: ${ks.originalMud?.yieldPoint?.value ?? "NA"} ${ks.originalMud?.yieldPoint?.unit?.notation ?? "NA"}');
    print('pumping.name: ${ks.pumpingMud?.name}');
    print('pumping.model: ${ks.pumpingMud?.model}');
    print(
        'pumping.mvtrAt600Rpm: ${ks.pumpingMud?.mvtrAt600Rpm?.value ?? "NA"} ${ks.pumpingMud?.mvtrAt600Rpm?.unit?.notation ?? "NA"}');
    print(
        'pumping.mvtrAt300Rpm: ${ks.pumpingMud?.mvtrAt300Rpm?.value ?? "NA"} ${ks.pumpingMud?.mvtrAt300Rpm?.unit?.notation ?? "NA"}');
    print(
        'pumping.density: ${ks.pumpingMud?.density?.value ?? "NA"} ${ks.pumpingMud?.density?.unit?.notation ?? "NA"}');
    print(
        'pumpOutput: ${ks.pumpOutput?.value ?? "NA"} ${ks.pumpOutput?.unit?.notation ?? "NA"}');
    print('sicp: ${ks.sicp?.value ?? "NA"} ${ks.sicp?.unit?.notation ?? "NA"}');
    print(
        'sidpp: ${ks.sidpp?.value ?? "NA"} ${ks.sidpp?.unit?.notation ?? "NA"}');
    print(
        'surfaceToBitVolume: ${ks.surfaceToBitVolume?.value ?? "NA"} ${ks.surfaceToBitVolume?.unit?.notation ?? "NA"}');
    print(
        'surfaceToBitStrokes: ${ks.surfaceToBitStrokes?.value ?? "NA"} ${ks.surfaceToBitStrokes?.unit?.notation ?? "NA"}');
    print(
        'surfaceToBitTime: ${ks.surfaceToBitTime?.value ?? "NA"} ${ks.surfaceToBitTime?.unit?.notation ?? "NA"}');
    print('tvd: ${ks.tvd?.value ?? "NA"} ${ks.tvd?.unit?.notation ?? "NA"}');
    print(
        'tvdFromRKBH: ${ks.tvdFromRKBH?.value ?? "NA"} ${ks.tvdFromRKBH?.unit?.notation ?? "NA"}');
    print(
        'totalStrokesToKillWell: ${ks.totalStrokesToKillWell?.value ?? "NA"} ${ks.totalStrokesToKillWell?.unit?.notation ?? "NA"}');
    print(
        'totalTimeToKillWell: ${ks.totalTimeToKillWell?.value ?? "NA"} ${ks.totalTimeToKillWell?.unit?.notation ?? "NA"}');
    print(
        'upperFitPressure: ${ks.upperFitPressure?.value ?? "NA"} ${ks.upperFitPressure?.unit?.notation ?? "NA"}');
    print('pcMax: ${ks.pcMax.value ?? "NA"} ${ks.pcMax.unit.notation ?? "NA"}');
    print('strokePressure chart: ${ks.arrWwmStrokesPressure ?? "NA"}');

    print('***********END*************');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Constants.configDetailsBack,
          centerTitle: true,
          leading: selectedPageCounter == 4
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPageCounter = 3;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 8),
                    child: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: InkWell(
                    onTap: (){
                      
                        Navigator.popAndPushNamed(context, '/activityselection',arguments: sc);
                    
                    },
                   
                                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Constants.textColor,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
          title: Column(
            children: [
              Text(
                '$selectedPageCounter of 4',
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                // 'killsheet',
                 getText('kill_sheet',context),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          actions: <Widget>[
            selectedPageCounter == 4
                ? Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/activityselection',arguments: sc);
                      },
                      child: Text(
                        getText('done',context),
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                : Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          selectedPageCounter--;
                        });
                      },
                      child: selectedPageCounter > 1 && selectedPageCounter < 4
                          ? Text(
                              getText('previous',context),
                              style: TextStyle(color: Colors.white),
                            )
                          : SizedBox(),
                    )),
            selectedPageCounter >= 1 && selectedPageCounter < 4
                ? Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          selectedPageCounter++;
                        });
                      },
                      child: Text(
                         getText('next',context),
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                : SizedBox(),
          ],
        ),
        body: selectedPageCounter == 1
            ? Column(
                children: [
                  Container(
                    // color: Colors.blue,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(getText('well_control_pre_kick_data_sheet',context),
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                           methodRig.isSubsea ? Text(getText('subsea_only', context)) : Text(getText('surface_only', context))
                              ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: overallMeasurement(),
                            ), //Overall Mesurements
                            Container(
                              // height: 50,
                              color: Colors.grey.withOpacity(0.4),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 4.0, bottom: 4.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        getText('capacities_and_volume',context),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            capacitiesAndVolumeTableView(), //Capacities And Volume Table View
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            : selectedPageCounter == 2
                ? Killsheettwo(current,methodRig)
                : selectedPageCounter == 3
                    ? KillSheetThree(current,methodRig)
                    : selectedPageCounter == 4
                        ? Killsheetfour(current,methodRig)
                        : SizedBox());
  }

  Widget overallMeasurement() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: nameValue(getText('name', context) + ':',sc.selectedField, '')),
                Expanded(
                    child: nameValue(getText('date', context) + ':', date, '')),
                Expanded(
                    child: nameValue(
                        getText('level', context) + ':', 'Supervisor', '')),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: 

                    methodRig.isSubsea?
                    nameValue(
                      
                        getText('measured_depth_from_rkb', context) + ':',
                        current.killSheet.tvd.value.toStringAsFixed(0),
                        'ft') :
                         nameValue(
                      
                        getText('measured_depth', context) + ':',
                        current.killSheet.tvd.value.toStringAsFixed(0),
                        'ft')
                        ),
                SizedBox(width: 14),
                Expanded(
                    child: 
                      methodRig.isSubsea?
                    nameValue(
                        getText('true_vertical_depth_from_rkb', context) + ':',
                        current.killSheet.tvd.value.toStringAsFixed(0),
                        'ft'):
                          nameValue(
                        getText('true_vertical_depth_tvd', context) + ':',
                        current.killSheet.tvd.value.toStringAsFixed(0),
                        'ft')
                        ),
              ],
            ),
            Row(
              children: [
                
                Expanded(
                    child: 
                    methodRig.isSubsea ?
                    nameValue(
                        getText('measured_casing_shoe_depth_from_rkb',
                                context) +
                            ':',
                        casingShoeDepthFromRKB.toStringAsFixed(0),
                        'ft'):
                         nameValue(
                        getText('measured_casing_shoe_depth',
                                context) +
                            ':',
                        casingShoeDepthFromRKB.toStringAsFixed(0),
                        'ft')
                        
                        ),
                SizedBox(width: 14),
                Expanded(
                    child: 
                      methodRig.isSubsea ?
                      nameValue(
                        getText('tvd_casing_shoe_from_rkb', context) + ':',
                        casingShoeDepthFromRKB.toStringAsFixed(0),
                        'ft')
                        :  nameValue(
                        getText('casing_shoe_tvd', context) + ':',
                        casingShoeDepthFromRKB.toStringAsFixed(0),
                        'ft')
                        ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child:
                     methodRig.isSubsea ?
                     nameValue(getText('water_depth', context) + ':',
                        waterDepth.toStringAsFixed(0), 'ft')
                     :   nameValue(getText('measured_depth_from_rkb', context) + ':',
                        waterDepth.toStringAsFixed(0), 'ft')
                        ),
                SizedBox(width: 14),
                Expanded(
                    child: 
                     methodRig.isSubsea ?
                    nameValue(getText('air_gap', context) + ':',
                        airGap.toStringAsFixed(0), 'ft')
                        :
                          nameValue(getText('tvd_from_rkb', context) + ':',
                        airGap.toStringAsFixed(0), 'ft')
                        )
                        ,
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: nameValue(getText('current_mud_weight', context),
                        currentMudWeight.toString(), 'ppg')),
                SizedBox(width: MediaQuery.of(context).size.width * 0.5),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget nameValue(String name, String value, String unit) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      FittedBox(
        child: Text(
          name,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(8.0),
                hintText: value,
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(3.7),
                ),
              )),
        ),
      ),
      Text(unit),
    ]);
  }

  Widget capacitiesAndVolumeTableView() {
    return Container(
      margin: EdgeInsets.only(left: 2, right: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      // margin: EdgeInsets.all(20),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(3),
                  // 1: FlexColumnWidth(2),
                  // 2: FlexColumnWidth(4),
                },
                border: TableBorder(
                  verticalInside: BorderSide(color: Colors.grey),
                  horizontalInside: BorderSide(color: Colors.grey),
                ),
                children: [
                  TableRow(children: [
                    Container(
                      height: 60,
                      child: Center(
                        child: Text(
                          getText('drill_string_data', context),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Center(
                          child: Text(
                        'O.D. (in)',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                    ),
                    Container(
                      height: 60,
                      child: Center(
                          child: Text(
                        'I.D. (in)',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                    ),
                    Container(
                      height: 60,
                      child: Center(
                          child: Text(
                        'Wt. (lb/ft)',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      height: 60,
                      width: 100,
                      child: Center(
                          child: Text(
                        'DRILL PIPE',
                        // style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                    ),
                    Container(
                      height: 60,
                      child: Center(
                          child: Text(
                        drillpipeOD.toString(),
                        // style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                    ),
                    Container(
                      height: 60,
                      child: Center(
                          child: Text(
                        drillpipeID.toString(),
                        // style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                    ),
                    Container(
                      height: 60,
                      child: Center(
                          child: Text(
                        '',
                        // style: TextStyle(fontWeight: FontWeight.w500),
                      )),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      height: 60,
                      width: 100,
                      child: Center(child: Text('HWDP')),
                    ),
                    Container(
                        height: 60,
                        child: Center(
                          child: Text(drillpipeID.toString()),
                        )),
                    Container(
                      height: 60,
                      child: Center(child: Text(drillpipeOD.toString())),
                    ),
                    Container(
                      height: 60,
                      child: Center(child: Text('')),
                    ),
                  ]),
                  TableRow(children: [
                    Container(
                      height: 60,
                      width: 100,
                      child: Center(child: Text('DRILL COLLARS')),
                    ),
                    Container(
                      height: 60,
                      child: Center(child: Text(drillCollarOD.toString())),
                    ),
                    Container(
                      height: 60,
                      child: Center(child: Text(drillCollarID.toString())),
                    ),
                    Container(
                      height: 60,
                      child: Center(child: Text('')),
                    ),
                  ]),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Table(
                    border: TableBorder(
                        verticalInside: BorderSide(color: Colors.grey),
                        horizontalInside: BorderSide(color: Colors.grey),
                        left: BorderSide(color: Colors.grey)),
                    children: [
                      TableRow(children: [
                        Container(
                          height: 30,
                          child: Center(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                Text('CAPACITY'),
                                Text('\u00D7'),
                                Text('LENGTH'),
                                Text('='),
                                Text('VOLUME'),
                              ])),
                        ),
                      ])
                    ],
                  ),
                  // Container(
                  //   height: 30,
                  //   child: Text('hello')),
                  Table(
                    // defaultColumnWidth: FixedColumnWidth(120.0),
                    border: TableBorder(
                        verticalInside: BorderSide(color: Colors.grey),
                        horizontalInside: BorderSide(color: Colors.grey),
                        left: BorderSide(color: Colors.grey)),
                    children: [
                      TableRow(children: [
                        Container(
                          height: 30,
                          child: Center(
                            child: Text(
                              '(bbl/ft)',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          child: Center(
                            child: Text('(ft)', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                        Container(
                          height: 30,
                          child: Center(
                            child:
                                Text('(bbl)', style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          height: 60,
                          child: Center(
                              child:
                                  Text(drillpipeCapacity.toStringAsFixed(4))),
                        ),
                        Container(
                          height: 60,
                          child:
                              Center(child: Text(drillpipeLength.toString())),
                        ),
                        Container(
                          height: 60,
                          child: Center(
                              child: Text(drillpipeVolume.toStringAsFixed(1))),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          height: 60,
                          child: Center(
                              child: Text(hwdpCapacity.toStringAsFixed(4))),
                        ),
                        Container(
                          height: 60,
                          child: Center(child: Text(hwdpLength.toString())),
                        ),
                        Container(
                          height: 60,
                          child: Center(
                              child: Text(hwdpVolume.toStringAsFixed(1))),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          height: 60,
                          child: Center(
                              child:
                                  Text(drillcollarCapacity.toStringAsFixed(4))),
                        ),
                        Container(
                          height: 60,
                          child:
                              Center(child: Text(drillCollarLength.toString())),
                        ),
                        Container(
                          height: 60,
                          child: Center(
                              child:
                                  Text(drillcollarVolume.toStringAsFixed(1))),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(3.5),
                  1: FlexColumnWidth(0.5),
                  2: FlexColumnWidth(0.5),
                },
                border: TableBorder(
                  verticalInside: BorderSide(color: Colors.grey),
                  horizontalInside: BorderSide(color: Colors.grey),
                  // bottom: BorderSide(color: Colors.grey),
                  top: BorderSide(color: Colors.grey),
                ),
                children: [
                  TableRow(
                    children: [
                      Container(
                        height: 60,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    height: 30.0,
                                    // width: 460.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: new Border.all(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 18.0, right: 18.0),
                                      child: Text(
                                        getText('check_that_total_length_measured_depth',context),
                                       
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ))),
                                // SizedBox(width: 100,),
                                // Icon(Icons.)
                                SizedBox(
                                  width: 18,
                                ),
                                // Icon(Icons.)
                                Image(
                                  image: AssetImage(
                                      'assets/images/iconArrowRight.png'),
                                  height: 32,
                                  width: 32,
                                ),
                                SizedBox(
                                  width: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        child: Stack(children: [
                          Center(
                            child: Text(
                              totalLength.toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Positioned(bottom: 1, right: 8, child: Text('ft')),
                        ]),
                      ),
                      Container(
                        height: 60,
                        child: Stack(children: [
                          Center(
                            child: Text(
                              totalVolumeDrillString.toStringAsFixed(2),
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Positioned(
                              bottom: 1, right: 8, child: Text('[bbls]')),
                        ]),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        Table(
          columnWidths: {
            0: FlexColumnWidth(0.666),
            1: FlexColumnWidth(1.2),
            2: FlexColumnWidth(0.798),
          },
          border: TableBorder(
              verticalInside: BorderSide(color: Colors.grey),
              horizontalInside: BorderSide(color: Colors.grey),
              top: BorderSide(color: Colors.grey),
              right: BorderSide(color: Colors.grey)),
          children: [
            TableRow(children: [
              Container(
                height: 60,
                child: Center(child: Text('ANNULUS DATA')),
              ),
              Column(
                children: [
                  Container(
                    height: 40,
                    child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          Text(
                            'CAPACITY',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text('\u00D7', style: TextStyle(fontSize: 12)),
                          Text('LENGTH', style: TextStyle(fontSize: 12)),
                          Text('=', style: TextStyle(fontSize: 12)),
                          Text('VOLUME', style: TextStyle(fontSize: 12)),
                        ])),
                  ),
                  Table(
                    border: TableBorder(
                      verticalInside: BorderSide(color: Colors.grey),
                      horizontalInside: BorderSide(color: Colors.grey),
                      // top: BorderSide(color: Colors.grey),
                      // right: BorderSide(color: Colors.grey)
                    ),
                    children: [
                      TableRow(children: [
                        Container(
                          height: 20,
                          child: Center(
                              child: Text(
                            '(bbl/ft)',
                            style: TextStyle(fontSize: 12),
                          )),
                        ),
                        Container(
                          height: 20,
                          child: Center(
                              child: Text(
                            '(ft)',
                            style: TextStyle(fontSize: 12),
                          )),
                        ),
                        Container(
                          height: 20,
                          child: Center(
                              child: Text(
                            '(bbl)',
                            style: TextStyle(fontSize: 12),
                          )),
                        ),
                      ])
                    ],
                  )
                ],
              ),
              Container(
                height: 60,
                child: Center(child: Text('')),
              ),
            ])
          ],
        ),
     methodRig.isSubsea ?   Row(children: [
           Expanded(
              flex: 7,
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(0.5),
                  1: FlexColumnWidth(0.3),
                  2: FlexColumnWidth(0.3),
                  3: FlexColumnWidth(0.3),
                },
                border: TableBorder(
                  verticalInside: BorderSide(color: Colors.grey),
                  horizontalInside: BorderSide(color: Colors.grey),
                 right: BorderSide(color: Colors.grey),
                  top: BorderSide(color: Colors.grey),
                ),
                children: [
                   TableRow(
                    children: [
                      Container(
                        height: 40,
                        child: Center(child: Text('CHOKE LINE',textAlign: TextAlign.center,)),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(chokeLineCapacity.toStringAsFixed(4))),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(chokeLineLength.toStringAsFixed(0))),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(chokeLineVolume.toStringAsFixed(1))),
                      ),
                    ],
                  ),
                ],
        
        )
        
           ),
           Expanded(
             flex: 3,
             child: Container())
           
           ] 
        ) : SizedBox(),
        Row(
          children: [
            Expanded(
              flex: 7,
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(0.5),
                  1: FlexColumnWidth(0.3),
                  2: FlexColumnWidth(0.3),
                  3: FlexColumnWidth(0.3),
                },
                border: TableBorder(
                  verticalInside: BorderSide(color: Colors.grey),
                  horizontalInside: BorderSide(color: Colors.grey),
                 bottom: BorderSide(color: Colors.grey),
                  top: BorderSide(color: Colors.grey),
                ),
                children: [
                  
                 
                  TableRow(
                    children: [
                      Container(
                        height: 40,
                        child: Center(child: Text('DRILLING PIPE IN CASING',textAlign: TextAlign.center,)),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(drillingPipeInCasingCapacity
                                .toStringAsFixed(4))),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                                drillingPipeInCasingLength.toStringAsFixed(0))),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                                drillingPipeInCasingVolume.toStringAsFixed(1))),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        height: 40,
                        child: Center(child: Text('DRILL PIPE IN OPEN HOLE',textAlign: TextAlign.center,)),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                                drillingPipeInOHCapacity.toStringAsFixed(4))),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                                drillingPipeInOHLength.toStringAsFixed(0))),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                                drillingPipeInOHVolume.toStringAsFixed(1))),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        height: 40,
                        child: Center(child: Text('HWDP IN OPEN HOLE',textAlign: TextAlign.center,)),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(hwdpInOHCapacity.toStringAsFixed(4))),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(hwdpInOHLength.toStringAsFixed(0))),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(hwdpInOHVolume.toStringAsFixed(1))),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Container(
                        height: 40,
                        child: Center(child: Text('DRILL COLLAR IN OPEN HOLE',textAlign: TextAlign.center,),),
                      ),
                      Container(
                          height: 40,
                          child: Center(
                              child: Text(
                                  drillcollarInOHCapacity.toStringAsFixed(4)))),
                      Container(
                        height: 40,
                        child: Center(
                            child:
                                Text(drillcollarInOHLength.toStringAsFixed(0))),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                          child: Text(drillcollarInOHVolume.toStringAsFixed(1)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Table(
                border: TableBorder(
                  verticalInside: BorderSide(color: Colors.grey),
                  // horizontalInside: BorderSide(color: Colors.grey),
                  left: BorderSide(color: Colors.grey),
                  top: BorderSide(color: Colors.grey),
                ),
                children: [
                  // TableRow(
                  //   children: [
                  //     Container(
                  //       height: 40,
                  //       child: Center(child: Text('')),
                  //     ),
                  //   ],
                  // ),
                  TableRow(
                    children: [
                      Container(
                        height: 160,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bit to Shoe Volume',
                              style: TextStyle(fontSize: 12),
                            ),
                            Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey)),
                              height: 60,
                              child: Stack(children: [
                                Center(
                                  child: Text(
                                    bitToShoeVolume.toStringAsFixed(1),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Positioned(
                                    bottom: 1, right: 8, child: Text('[bbls]')),
                              ]),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Table(
          columnWidths: {
            0: FlexColumnWidth(1.334),
            1: FlexColumnWidth(0.5),
            2: FlexColumnWidth(0.5),
          },
          border: TableBorder(
            verticalInside: BorderSide(color: Colors.grey),
            horizontalInside: BorderSide(color: Colors.grey),
            bottom: BorderSide(color: Colors.grey),
            // top: BorderSide(color: Colors.grey),
          ),
          children: [
            TableRow(
              children: [
                // Container(
                //   height: 60,
                //   child: Center(
                //     child: Padding(
                //       padding: const EdgeInsets.all(4.0),
                //       child: Row(
                //         children: [
                //           Flexible(
                //                                             child: Container(
                //                 height: 30.0,
                //                 // width: 460.0,
                //                 decoration: new BoxDecoration(
                //                   shape: BoxShape.rectangle,
                //                   border: new Border.all(
                //                     color: Colors.black,
                //                     width: 1.0,
                //                   ),
                //                 ),
                //                 child: Center(
                //                     child: Text(
                //                       'CHECK THAT TOTAL LENGTH = MESURED DEPTH',
                //                       style: TextStyle(fontSize: 12),
                //                     ))),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  height: 60,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                                height: 30.0,
                                // width: 460.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: new Border.all(
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                                child: Center(
                                  child: 
                                 methodRig.isSubsea ? Text(
                                    getText(
                                        'note_total_length_may_not_be_equal_to_measured_depth_if_the_choke_line_is_longer_than_the_riser',
                                        context),
                                    style: TextStyle(fontSize: 9),
                                    textAlign: TextAlign.center,
                                  ):
                                  Text(
                                    getText(
                                        'check_that_total_length_measured_depth',
                                        context),
                                    style: TextStyle(fontSize: 9),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          // Icon(Icons.)
                          Image(
                            image:
                                AssetImage('assets/images/iconArrowRight.png'),
                            height: 32,
                            width: 32,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  child: Stack(children: [
                    Center(
                      child: Text(
                        totalAnnulusLength.toStringAsFixed(0),
                        // style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Positioned(bottom: 1, right: 8, child: Text('ft')),
                  ]),
                ),
                Container(
                  height: 60,
                  child: Stack(children: [
                    Center(
                      child: Text(
                        totalAnnulusVolume.toStringAsFixed(1),
                        // style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Positioned(bottom: 1, right: 8, child: Text('[bbls]')),
                  ]),
                ),
                Table(
                  children: [
                    TableRow(
                        children: [
    Container(
                    height: 60,
                    child: 
                    Text(''),),
                        ]
                    )
                  ],
                               
                ),
                
              ],
            )
          ],
        ),
        new Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      getText('total_drillstring', context),
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                    Text(getText('surface_to_bit', context),
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                             fontWeight: FontWeight.w600)
                     ),
                    SizedBox(
                      height: 8,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Stack(
                        children: [
                          TextFormField(
                            textAlign: TextAlign.center,
                            readOnly: true,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(8.0),
                              hintText:
                                  totalVolumeDrillString.toStringAsFixed(1),
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  // fontWeight: FontWeight.w500,
                                  fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5.7),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 1,
                              right: 4,
                              child: Text(
                                '[bbls]',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                    )
                    // Text("My Awesome Border"),
                  ],
                ),
                Text("+"),
                Column(
                  children: [
                    Text(getText('total_annulus', context),
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    Text(getText('bit_to_surface', context),
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 8,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Stack(
                        children: [
                          TextFormField(
                            textAlign: TextAlign.center,
                            readOnly: true,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(8.0),
                              hintText: totalAnnulusVolume.toStringAsFixed(1),
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  // fontWeight: FontWeight.w500,
                                  fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5.7),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 1,
                              right: 4,
                              child: Text(
                                '[bbls]',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                    )
                    // Text("My Awesome Border"),
                  ],
                ),
                Text("="),
                Column(
                  children: [
                    Text(getText('total_system_volume', context),
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),

                    SizedBox(
                      height: 8,
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Stack(
                        children: [
                          TextFormField(
                            textAlign: TextAlign.center,
                            readOnly: true,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(8.0),
                              hintText:
                                  (totalAnnulusVolume + totalVolumeDrillString)
                                      .toStringAsFixed(1),
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  // fontWeight: FontWeight.w500,
                                  fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5.7),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 1,
                              right: 4,
                              child: Text(
                                '[bbls]',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                    )
                    // Text("My Awesome Border"),
                  ],
                ),
              ],
            ),
          ),
        ),
       
       
       
       
       
    methodRig.isSubsea ?    Table(
          columnWidths: {
            0: FlexColumnWidth(0.666),
            1: FlexColumnWidth(1.2),
            2: FlexColumnWidth(0.798),
          },
          border: TableBorder(
              // verticalInside: BorderSide(color: Colors.grey),
              // horizontalInside: BorderSide(color: Colors.grey),
              //  top: BorderSide(color: Colors.grey),
              //  right: BorderSide(color: Colors.grey),
              //  left:  BorderSide(color: Colors.grey),
              ),
          children: [
            TableRow(children: [
              Table(
                 border: TableBorder(
              // verticalInside: BorderSide(color: Colors.grey),
              // horizontalInside: BorderSide(color: Colors.grey),
               bottom: BorderSide(color: Colors.grey),
              
              ),
                children: [
                  TableRow(
                    children:[
 Container(
                  height: 60,
                  child: Center(child: Text('')),
                ),
                    ]
                  )
                ],
                            
              ),
              Table(
                  border: TableBorder(
              // verticalInside: BorderSide(color: Colors.grey),
              // horizontalInside: BorderSide(color: Colors.grey),
               top: BorderSide(color: Colors.grey),
               right: BorderSide(color: Colors.grey),
               left:  BorderSide(color: Colors.grey),
              ),
                              children: [
                  TableRow(
                                      children: [
                                        Column(
                      children: [
                        Container(
                          height: 40,
                          child: Center(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                Text(
                                  'CAPACITY',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text('\u00D7', style: TextStyle(fontSize: 12)),
                                Text('LENGTH', style: TextStyle(fontSize: 12)),
                                Text('=', style: TextStyle(fontSize: 12)),
                                Text('VOLUME', style: TextStyle(fontSize: 12)),
                              ])),
                        ),
                        Table(
                          border: TableBorder(
                            verticalInside: BorderSide(color: Colors.grey),
                            horizontalInside: BorderSide(color: Colors.grey),
                            bottom: BorderSide(color: Colors.grey),
                            // right: BorderSide(color: Colors.grey)
                          ),
                          children: [
                            TableRow(children: [
                              Container(
                                height: 20,
                                child: Center(
                                    child: Text(
                                  '(bbl/ft)',
                                  style: TextStyle(fontSize: 12),
                                )),
                              ),
                              Container(
                                height: 20,
                                child: Center(
                                    child: Text(
                                  '(ft)',
                                  style: TextStyle(fontSize: 12),
                                )),
                              ),
                              Container(
                                height: 20,
                                child: Center(
                                    child: Text(
                                  '(bbl)',
                                  style: TextStyle(fontSize: 12),
                                )),
                              ),
                            ])
                          ],
                        )
                      ],
                    ),]
                  ),
                ],
              ),
              Container(
                height: 60,
                child: Center(child: Text('')),
              ),
            ]),
            TableRow(
              children: [
                Table(
                   border: TableBorder(
                   
                  //  top: BorderSide(color: Colors.grey),
                    //  right: BorderSide(color: Colors.grey),
                    //  left: BorderSide(color: Colors.grey)
                  ),
                                  children: [
                                    TableRow(
                                      children: [
                                           Container(
                    height: 40,
                    child: Center(child: Text('RISER VOLUME')),
                  ),
                                      ]
                                    )
                                  ]
                                  
                               
                ),
                // Container(
                //   height: 40,
                //   child: Center(child: Text(drillcollarInOHCapacity.toStringAsFixed(4)))),

                Table(
                  border: TableBorder(
                    verticalInside: BorderSide(color: Colors.grey),
                    horizontalInside: BorderSide(color: Colors.grey),
                    // top: BorderSide(color: Colors.grey),
                     right: BorderSide(color: Colors.grey),
                     left: BorderSide(color: Colors.grey)
                  ),
                  children: [
                    TableRow(children: [
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                         riserCapacity.toStringAsFixed(4),
                          style: TextStyle(fontSize: 12),
                        )),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                          riserLength.toStringAsFixed(0),
                          style: TextStyle(fontSize: 12),
                        )),
                      ),
                      Container(
                        height: 40,
                        child: Center(
                            child: Text(
                          riserVolume.toStringAsFixed(0),
                          style: TextStyle(fontSize: 12),
                        )),
                      ),
                    ])
                  ],
                ),

                Container(
                  height: 40,
                  child: Center(child: Text('')),
                ),
              ],
            ),
          ],
        ) : SizedBox(),
      ]),
    );
  }
}
