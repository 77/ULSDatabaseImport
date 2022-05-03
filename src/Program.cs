using System;
using System.Collections.Generic;

namespace ULSDatabaseImport
{
   internal class Program
   {
      private static void Main( string[] args )
      {
         const string outputPath = @"D:\temp\Output\";
         ImportULSData dd = new ImportULSData();
         List<string> URLsGeneralLic = new List<string>();
         List<string> URLsGeneralApp = new List<string>();
         List<string> URLsTowerApp = new List<string>();
         List<string> URLsTower = new List<string>();
         List<string> URLsOwner = new List<string>();
         List<string> URLsOther = new List<string>();
         List<string> URLsVacated = new List<string>();
         string savedFileName;
         string fileNameOrPath;
         TimeSpan tsStart = new TimeSpan( DateTime.UtcNow.Ticks );

         string webUrl = ULSDatabaseImport.Properties.Settings.Default.WebURL;

         URLsOwner.Add( "http://" + webUrl + "/uls/data/complete/owner.zip" ); // Special Owner Tables

         URLsVacated.Add( "http://" + webUrl + "/uls/data/complete/vs_market.zip" ); // Special Vacated Tables
         URLsVacated.Add( "http://" + webUrl + "/uls/data/complete/vs_site.zip" ); // Special Vacated Tables

         URLsOther.Add( "http://" + webUrl + "/uls/about/airport.txt" ); // Special No Tables Yet
         URLsOther.Add( "http://" + webUrl + "/uls/about/runway.txt" ); // Special No Tables Yet

         URLsTowerApp.Add( "http://" + webUrl + "/uls/data/complete/a_tower.zip" ); // Special Tower Tables. What does A mean?

         URLsTower.Add( "http://" + webUrl + "/uls/data/complete/d_tower.zip" ); // Special Tower Tables. What does D mean?
         URLsTower.Add( "http://" + webUrl + "/uls/data/complete/r_tower.zip" ); // Special Tower Tables. What does R mean?

         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_aircr.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_amat.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_cell.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_coast.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_frc.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_gmrs.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_LMbcast.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_LMcomm.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_LMpriv.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_market.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_mdsitfs.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_micro.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_paging.zip" );
         URLsGeneralLic.Add( "http://" + webUrl + "/uls/data/complete/l_ship.zip" );

         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_aatc.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_aircr.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_amat.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_cell.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_coast.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_frc.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_gmrs.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_lease.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_lease_608.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_LMbcast.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_LMcomm.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_LMpriv.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_market.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_mdsitfs.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_micro.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_paging.zip" );
         URLsGeneralApp.Add( "http://" + webUrl + "/uls/data/complete/a_ship.zip" );

         foreach( string urlPath in URLsOwner )
         {
            savedFileName = dd.ProcessDownload( urlPath, outputPath );
            fileNameOrPath = dd.ExtractContents( savedFileName );
            dd.IngestFlatFilesBulk( fileNameOrPath, ImportULSData.IngestionType.Owner );
         }

         foreach( string urlPath in URLsVacated )
         {
            savedFileName = dd.ProcessDownload( urlPath, outputPath );
            fileNameOrPath = dd.ExtractContents( savedFileName );
            dd.IngestFlatFilesBulk( fileNameOrPath, ImportULSData.IngestionType.Vacated );
         }

         foreach( string urlPath in URLsOther )
         {
            savedFileName = dd.ProcessDownload( urlPath, outputPath );
            fileNameOrPath = dd.ExtractContents( savedFileName );
            //dd.IngestFlatFilesBulk( fileNameOrPath, ImportULSData.IngestionType.Other );
         }

         foreach( string urlPath in URLsTowerApp )
         {
            savedFileName = dd.ProcessDownload( urlPath, outputPath );
            fileNameOrPath = dd.ExtractContents( savedFileName );
            dd.IngestFlatFilesBulk( fileNameOrPath, ImportULSData.IngestionType.TowerApplication );
         }

         foreach( string urlPath in URLsTower )
         {
            savedFileName = dd.ProcessDownload( urlPath, outputPath );
            fileNameOrPath = dd.ExtractContents( savedFileName );
            dd.IngestFlatFilesBulk( fileNameOrPath, ImportULSData.IngestionType.Tower );
         }

         foreach( string urlPath in URLsGeneralLic )
         {
            savedFileName = dd.ProcessDownload( urlPath, outputPath );
            fileNameOrPath = dd.ExtractContents( savedFileName );
            dd.IngestFlatFilesBulk( fileNameOrPath, ImportULSData.IngestionType.General );
         }

         foreach( string urlPath in URLsGeneralApp )
         {
            savedFileName = dd.ProcessDownload( urlPath, outputPath );
            fileNameOrPath = dd.ExtractContents( savedFileName );
            dd.IngestFlatFilesBulk( fileNameOrPath, ImportULSData.IngestionType.Application );
         }

         TimeSpan tsEnd = new TimeSpan( DateTime.UtcNow.Ticks );
         Console.WriteLine( "Total App Time: " + ( tsEnd - tsStart ).ToString() );
      }
   }
}