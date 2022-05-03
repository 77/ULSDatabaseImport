using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.IO;
using System.Net;
using ICSharpCode.SharpZipLib.Zip;

namespace ULSDatabaseImport
{
   #region Import ULS Data
   public class ImportULSData
   {
      private Hashtable tableColCount;

      #region IngestionType enum

      public enum IngestionType
      {
         Application,
         General,
         Other,
         Owner,
         TowerApplication,
         Tower,
         Vacated
      }

      #endregion

      private byte[] _downloadedData;
      private readonly string connStr = ULSDatabaseImport.Properties.Settings.Default.FCC_ULS_ImportDB;
      private DBScripting dbs = null;
      private FileStream fs = null;
      private StreamWriter sw = null;
      private FileStream fsSQL = null;
      private StreamWriter swSQL = null;
      //private FileStream fsSQLOut = null;
      //private StreamWriter swSQLOut = null;

      public ImportULSData()
      {
         dbs = new DBScripting( connStr );
         tableColCount = new Hashtable();

         #region Table Details
         // Table column definition data
         // TODO: Convert this to a text file that is read in and then parsed.
         tableColCount.Add( "AUCTION_FREQ", "5" );
         tableColCount.Add( "OWNER_PUBACC_A", "25" );
         tableColCount.Add( "OWNER_PUBACC_D", "59" );
         tableColCount.Add( "OWNER_PUBACC_F", "10" );
         tableColCount.Add( "OWNER_PUBACC_H", "11" );
         tableColCount.Add( "OWNER_PUBACC_O", "32" );
         tableColCount.Add( "OWNER_PUBACC_T", "10" );

         tableColCount.Add( "PUBACC_APP_A2", "12" );
         tableColCount.Add( "PUBACC_APP_A3", "38" );
         tableColCount.Add( "PUBACC_APP_AC", "10" );
         tableColCount.Add( "PUBACC_APP_AD", "30" );
         tableColCount.Add( "PUBACC_APP_AG", "10" );
         tableColCount.Add( "PUBACC_APP_AH", "5" );
         tableColCount.Add( "PUBACC_APP_AM", "18" );
         tableColCount.Add( "PUBACC_APP_AN", "36" );
         tableColCount.Add( "PUBACC_APP_AP", "12" );
         tableColCount.Add( "PUBACC_APP_AS", "9" );
         tableColCount.Add( "PUBACC_APP_AT", "9" );
         tableColCount.Add( "PUBACC_APP_BC", "11" );
         tableColCount.Add( "PUBACC_APP_BD", "33" );
         tableColCount.Add( "PUBACC_APP_BE", "9" );
         tableColCount.Add( "PUBACC_APP_BF", "11" );
         tableColCount.Add( "PUBACC_APP_BL", "9" );
         tableColCount.Add( "PUBACC_APP_BO", "8" );
         tableColCount.Add( "PUBACC_APP_BT", "5" );
         tableColCount.Add( "PUBACC_APP_CD", "10" );
         tableColCount.Add( "PUBACC_APP_CF", "16" );
         tableColCount.Add( "PUBACC_APP_CG", "43" );
         tableColCount.Add( "PUBACC_APP_CO", "8" );
         tableColCount.Add( "PUBACC_APP_CP", "14" );
         tableColCount.Add( "PUBACC_APP_CS", "12" );
         tableColCount.Add( "PUBACC_APP_EM", "16" );
         tableColCount.Add( "PUBACC_APP_EN", "27" );
         tableColCount.Add( "PUBACC_APP_F2", "19" );
         tableColCount.Add( "PUBACC_APP_F3", "31" );
         tableColCount.Add( "PUBACC_APP_F4", "20" );
         tableColCount.Add( "PUBACC_APP_F5", "13" );
         tableColCount.Add( "PUBACC_APP_F6", "17" );
         tableColCount.Add( "PUBACC_APP_FA", "15" );
         tableColCount.Add( "PUBACC_APP_FC", "9" );
         tableColCount.Add( "PUBACC_APP_FF", "13" );
         tableColCount.Add( "PUBACC_APP_FR", "29" );
         tableColCount.Add( "PUBACC_APP_FS", "11" );
         tableColCount.Add( "PUBACC_APP_FT", "11" );
         tableColCount.Add( "PUBACC_APP_HD", "50" );
         tableColCount.Add( "PUBACC_APP_HS", "6" );
         tableColCount.Add( "PUBACC_APP_IA", "12" );
         tableColCount.Add( "PUBACC_APP_IR", "14" );
         tableColCount.Add( "PUBACC_APP_L2", "15" );
         tableColCount.Add( "PUBACC_APP_L3", "52" );
         tableColCount.Add( "PUBACC_APP_L4", "17" );
         tableColCount.Add( "PUBACC_APP_L5", "12" );
         tableColCount.Add( "PUBACC_APP_L6", "14" );
         tableColCount.Add( "PUBACC_APP_LA", "8" );
         tableColCount.Add( "PUBACC_APP_LC", "8" );
         tableColCount.Add( "PUBACC_APP_LD", "9" );
         tableColCount.Add( "PUBACC_APP_LF", "10" );
         tableColCount.Add( "PUBACC_APP_LH", "5" );
         tableColCount.Add( "PUBACC_APP_LL", "7" );
         tableColCount.Add( "PUBACC_APP_LM", "9" );
         tableColCount.Add( "PUBACC_APP_LO", "51" );
         tableColCount.Add( "PUBACC_APP_LS", "8" );
         tableColCount.Add( "PUBACC_APP_MC", "15" );
         tableColCount.Add( "PUBACC_APP_ME", "7" );
         tableColCount.Add( "PUBACC_APP_MF", "9" );
         tableColCount.Add( "PUBACC_APP_MH", "8" );
         tableColCount.Add( "PUBACC_APP_MI", "8" );
         tableColCount.Add( "PUBACC_APP_MK", "20" );
         tableColCount.Add( "PUBACC_APP_MP", "13" );
         tableColCount.Add( "PUBACC_APP_MW", "14" );
         tableColCount.Add( "PUBACC_APP_O2", "12" );
         tableColCount.Add( "PUBACC_APP_OP", "10" );
         tableColCount.Add( "PUBACC_APP_P2", "24" );
         tableColCount.Add( "PUBACC_APP_PA", "22" );
         tableColCount.Add( "PUBACC_APP_PC", "23" );
         tableColCount.Add( "PUBACC_APP_RA", "18" );
         tableColCount.Add( "PUBACC_APP_RC", "14" );
         tableColCount.Add( "PUBACC_APP_RE", "5" );
         tableColCount.Add( "PUBACC_APP_RI", "12" );
         tableColCount.Add( "PUBACC_APP_RZ", "10" );
         tableColCount.Add( "PUBACC_APP_SC", "9" );
         tableColCount.Add( "PUBACC_APP_SE", "42" );
         tableColCount.Add( "PUBACC_APP_SF", "11" );
         tableColCount.Add( "PUBACC_APP_SG", "15" );
         tableColCount.Add( "PUBACC_APP_SH", "27" );
         tableColCount.Add( "PUBACC_APP_SI", "7" );
         tableColCount.Add( "PUBACC_APP_SR", "21" );
         tableColCount.Add( "PUBACC_APP_SV", "7" );
         tableColCount.Add( "PUBACC_APP_TA", "51" );
         tableColCount.Add( "PUBACC_APP_TL", "12" );
         tableColCount.Add( "PUBACC_APP_TP", "14" );
         tableColCount.Add( "PUBACC_APP_UA", "10" );
         tableColCount.Add( "PUBACC_APP_VC", "6" );

         tableColCount.Add( "PUBACC_A2", "12" );
         tableColCount.Add( "PUBACC_A3", "38" );
         tableColCount.Add( "PUBACC_AC", "10" );
         tableColCount.Add( "PUBACC_AD", "30" );
         tableColCount.Add( "PUBACC_AG", "10" );
         tableColCount.Add( "PUBACC_AH", "5" );
         tableColCount.Add( "PUBACC_AM", "18" );
         tableColCount.Add( "PUBACC_AN", "36" );
         tableColCount.Add( "PUBACC_AP", "12" );
         tableColCount.Add( "PUBACC_AS", "9" );
         tableColCount.Add( "PUBACC_AT", "9" );
         tableColCount.Add( "PUBACC_BC", "11" );
         tableColCount.Add( "PUBACC_BD", "33" );
         tableColCount.Add( "PUBACC_BE", "9" );
         tableColCount.Add( "PUBACC_BF", "11" );
         tableColCount.Add( "PUBACC_BL", "9" );
         tableColCount.Add( "PUBACC_BO", "8" );
         tableColCount.Add( "PUBACC_BT", "5" );
         tableColCount.Add( "PUBACC_CD", "10" );
         tableColCount.Add( "PUBACC_CF", "16" );
         tableColCount.Add( "PUBACC_CG", "43" );
         tableColCount.Add( "PUBACC_CO", "8" );
         tableColCount.Add( "PUBACC_CP", "14" );
         tableColCount.Add( "PUBACC_CS", "12" );
         tableColCount.Add( "PUBACC_EM", "16" );
         tableColCount.Add( "PUBACC_EN", "27" );
         tableColCount.Add( "PUBACC_F2", "19" );
         tableColCount.Add( "PUBACC_F3", "31" );
         tableColCount.Add( "PUBACC_F4", "20" );
         tableColCount.Add( "PUBACC_F5", "13" );
         tableColCount.Add( "PUBACC_F6", "17" );
         tableColCount.Add( "PUBACC_FA", "15" );
         tableColCount.Add( "PUBACC_FC", "9" );
         tableColCount.Add( "PUBACC_FF", "13" );
         tableColCount.Add( "PUBACC_FR", "29" );
         tableColCount.Add( "PUBACC_FS", "11" );
         tableColCount.Add( "PUBACC_FT", "11" );
         tableColCount.Add( "PUBACC_HD", "50" );
         tableColCount.Add( "PUBACC_HS", "6" );
         tableColCount.Add( "PUBACC_IA", "12" );
         tableColCount.Add( "PUBACC_IR", "14" );
         tableColCount.Add( "PUBACC_L2", "15" );
         tableColCount.Add( "PUBACC_L3", "52" );
         tableColCount.Add( "PUBACC_L4", "17" );
         tableColCount.Add( "PUBACC_L5", "12" );
         tableColCount.Add( "PUBACC_L6", "14" );
         tableColCount.Add( "PUBACC_LA", "8" );
         tableColCount.Add( "PUBACC_LC", "8" );
         tableColCount.Add( "PUBACC_LD", "9" );
         tableColCount.Add( "PUBACC_LF", "10" );
         tableColCount.Add( "PUBACC_LH", "5" );
         tableColCount.Add( "PUBACC_LL", "7" );
         tableColCount.Add( "PUBACC_LM", "9" );
         tableColCount.Add( "PUBACC_LO", "51" );
         tableColCount.Add( "PUBACC_LS", "8" );
         tableColCount.Add( "PUBACC_MC", "15" );
         tableColCount.Add( "PUBACC_ME", "7" );
         tableColCount.Add( "PUBACC_MF", "9" );
         tableColCount.Add( "PUBACC_MH", "8" );
         tableColCount.Add( "PUBACC_MI", "8" );
         tableColCount.Add( "PUBACC_MK", "20" );
         tableColCount.Add( "PUBACC_MP", "13" );
         tableColCount.Add( "PUBACC_MW", "14" );
         tableColCount.Add( "PUBACC_O2", "12" );
         tableColCount.Add( "PUBACC_OP", "10" );
         tableColCount.Add( "PUBACC_P2", "24" );
         tableColCount.Add( "PUBACC_PA", "22" );
         tableColCount.Add( "PUBACC_PC", "23" );
         tableColCount.Add( "PUBACC_RA", "18" );
         tableColCount.Add( "PUBACC_RC", "14" );
         tableColCount.Add( "PUBACC_RE", "5" );
         tableColCount.Add( "PUBACC_RI", "12" );
         tableColCount.Add( "PUBACC_RZ", "10" );
         tableColCount.Add( "PUBACC_SC", "9" );
         tableColCount.Add( "PUBACC_SE", "42" );
         tableColCount.Add( "PUBACC_SF", "11" );
         tableColCount.Add( "PUBACC_SG", "15" );
         tableColCount.Add( "PUBACC_SH", "27" );
         tableColCount.Add( "PUBACC_SI", "7" );
         tableColCount.Add( "PUBACC_SR", "21" );
         tableColCount.Add( "PUBACC_SV", "7" );
         tableColCount.Add( "PUBACC_TA", "51" );
         tableColCount.Add( "PUBACC_TL", "12" );
         tableColCount.Add( "PUBACC_TP", "14" );
         tableColCount.Add( "PUBACC_UA", "10" );
         tableColCount.Add( "PUBACC_VC", "6" );

         tableColCount.Add( "TOWER_PUBACC_APP_AT", "8" );
         tableColCount.Add( "TOWER_PUBACC_APP_CO", "16" );
         tableColCount.Add( "TOWER_PUBACC_APP_DE", "30" );
         tableColCount.Add( "TOWER_PUBACC_APP_DP", "4" );
         tableColCount.Add( "TOWER_PUBACC_APP_DR", "5" );
         tableColCount.Add( "TOWER_PUBACC_APP_EN", "21" );
         tableColCount.Add( "TOWER_PUBACC_APP_HS", "7" );
         tableColCount.Add( "TOWER_PUBACC_APP_RA", "38" );
         tableColCount.Add( "TOWER_PUBACC_APP_RE", "9" );
         tableColCount.Add( "TOWER_PUBACC_APP_RS", "9" );
         tableColCount.Add( "TOWER_PUBACC_APP_SC", "8" );

         tableColCount.Add( "TOWER_PUBACC_AT", "8" );
         tableColCount.Add( "TOWER_PUBACC_CO", "16" );
         tableColCount.Add( "TOWER_PUBACC_DE", "30" );
         tableColCount.Add( "TOWER_PUBACC_DP", "4" );
         tableColCount.Add( "TOWER_PUBACC_DR", "5" );
         tableColCount.Add( "TOWER_PUBACC_EN", "21" );
         tableColCount.Add( "TOWER_PUBACC_HS", "7" );
         tableColCount.Add( "TOWER_PUBACC_RA", "38" );
         tableColCount.Add( "TOWER_PUBACC_RE", "9" );
         tableColCount.Add( "TOWER_PUBACC_RS", "9" );
         tableColCount.Add( "TOWER_PUBACC_SC", "8" );

         tableColCount.Add( "VACATED_PUBACC_AN", "36" );
         tableColCount.Add( "VACATED_PUBACC_EN", "27" );
         tableColCount.Add( "VACATED_PUBACC_FR", "29" );
         tableColCount.Add( "VACATED_PUBACC_HD", "50" );
         tableColCount.Add( "VACATED_PUBACC_LO", "51" );
         tableColCount.Add( "VACATED_PUBACC_MK", "20" );
         tableColCount.Add( "VACATED_PUBACC_VS", "8" );
         #endregion
      }

      public bool IngestFlatFiles( string fileNameOrPath, IngestionType type )
      {
         TimeSpan tsStart = new TimeSpan( DateTime.UtcNow.Ticks );
         bool isSuccess = false;

         DirectoryInfo di = new DirectoryInfo( fileNameOrPath );
         FileInfo fi = new FileInfo( fileNameOrPath );

         Console.WriteLine( "Importing Contents into Database for type {0}", type );

         if( di.Exists )
         {
            fs = new FileStream( @"D:\Temp\Output\" + di.Name + "-ImportErrors.log", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite );
            sw = new StreamWriter( fs );
            sw.AutoFlush = true;

            fsSQL = new FileStream( @"D:\Temp\Output\" + di.Name + "-ImportErrors.sql", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite );
            swSQL = new StreamWriter( fsSQL );
            swSQL.AutoFlush = true;

            sw.WriteLine( "Error Log for {0}\r\n", DateTime.UtcNow );
            swSQL.WriteLine( "--Failed SQL Statments {0}\r\n", DateTime.UtcNow );

            foreach( FileInfo file in di.GetFiles( "*.dat" ) )
            {
               Console.WriteLine( file.Name );

               bool fudgeFactor = false;
               int lineCount = 0;
               int totalLineCount = 0;
               StreamReader readFile = file.OpenText();
               string buffer;
               string tableId = file.Name.Split( '.' )[ 0 ].ToUpper().Replace( "_", "" ).Trim();
               string tableIdCheck;
               ArrayList tArray = new ArrayList();
               StringBuilder sqlInsertStatement = new StringBuilder();

               swSQL.WriteLine( "--BEGINING OF SQL BLOCK FOR {0}\r\n", file.Name );

               #region Read File Contents

               // Read from file until the end
               while( ( buffer = readFile.ReadLine() ) != null )
               {
                  tArray.Clear();

                  // remove the sql killing character '
                  buffer = buffer.Replace( "'", " " );

                  if( buffer.Length == 0 || buffer[ 0 ] == ' ' )
                  {
                     Console.WriteLine( "Warning: Buffer Empty" );
                     continue;
                  }

                  foreach( string buff in buffer.Split( '|' ) )
                     tArray.Add( buff );

                  tableIdCheck = ( string )tArray[ 0 ];

                  if( tableIdCheck != tableId )
                  {
                     Console.WriteLine( "Table Header Mismatch:   Found := {0} | TableID := {1}", tableIdCheck, tableId );
                     sw.WriteLine( "Table Header Mismatch:   Found := {0} | TableID := {1}", tableIdCheck, tableId );
                     sw.WriteLine( "Buffer := {0}\r\n", buffer );
                     continue;
                  }

                  string tableName = GetTableHeader( type ) + tArray[ 0 ];
                  int colCount = GetTableSchemaColCount( tableName );

                  switch( tableName )
                  {
                     case "VACATED_PUBACC_LO":
                        fudgeFactor = true; // Missing FCC Data
                        break;
                     default:
                        fudgeFactor = false; // Missing FCC Data
                        break;
                  }

                  // the data being inserted must match the columns in the database. Look to remote extranious /r/n.
                  while( colCount > tArray.Count )
                  {
                     if( !fudgeFactor )
                     {
                        // append to the buffered read line until it matches the column count.
                        buffer += readFile.ReadLine();

                        // remove the sql killing character '
                        buffer = buffer.Replace( "'", " " );
                     }
                     else
                     {
                        buffer += "|";
                     }

                     tArray.Clear();

                     foreach( string buff in buffer.Split( '|' ) )
                        tArray.Add( buff );

                     //TODO: Figure out a good way to recover this data. Currently it is lost since there are no | at the end of the file.
                     //      For right now data will be lost and will most likely be recorded as a "Table Header Mismatch".
                     //EXAMPLE:BEGIN
                     //SV|1944304|0001359842||EX10|2|ce between consecutive ports approx. 32 miles.
                     //
                     //To operate the ferry vessel we are required to have an inland operators license which is for "inland waters, bays, lakes and sounds.
                     //
                     //Our onboard equipment includes: 1 company cell 'phone, which is always in
                     //SV|1944304|0001359842||EX10|3| range, 2 VHF radios, always in range, One company VHF radio, always in range.  We are no more than 1 hour from port at any time.  We are in close proximity to three U.S.C.G. Bases, (Woods Hole, Menemsha, and Nantucket).  We also have 100% capacity lifera
                     //EXAMPLE:END
                  }

                  if( tArray.Count > 0 )
                  {
                     // prep for sql statement build process.
                     sqlInsertStatement.Clear();

                     sqlInsertStatement.AppendFormat( "INSERT INTO dbo.{0} VALUES (", tableName );

                     // prep to insert null if the value is empty
                     foreach( string item in tArray )
                     {
                        if( string.IsNullOrEmpty( item.Trim() ) )
                           sqlInsertStatement.AppendFormat( "null," );
                        else
                           sqlInsertStatement.AppendFormat( "'{0}',", item.Trim() );
                     }

                     sqlInsertStatement.Replace( ',', ')', sqlInsertStatement.Length - 1, 1 );
                     sqlInsertStatement.Append( "\r\n" );

                     if( tArray.Count == colCount )
                     {
                        dbs.Open(); // open DB connection
                        // do the insert. Max length cannot exceed the size of a long for the sql statment. Can do bulk insert
                        int result = dbs.Execute( sqlInsertStatement.ToString(), false );
                        dbs.Close(); // close the db connection

                        if( result <= 0 )
                        {
                           sw.WriteLine( "ErrorMessage := {0}", dbs.LastErrorMessage );
                           sw.WriteLine( "Buffer := {0}\r\n", buffer );
                           sw.WriteLine( "SQLStatement := {0}", sqlInsertStatement );

                           swSQL.WriteLine( "--Buffer := {0}", buffer );
                           swSQL.WriteLine( "{0}\r\n--SPLIT--\r\n", sqlInsertStatement );
                        }
                        else
                        {
                           lineCount++;
                        }

                        if( lineCount > 2500 )
                        {
                           Console.Write( "." );
                           totalLineCount += lineCount;
                           lineCount = 0;
                        }
                     }
                     else
                     {
                        Console.WriteLine( "Columns Current / Columns Total : {0}/{1}", tArray.Count, colCount );
                        sw.WriteLine( "Column Mismatch   current/table : {0}/{1}", tArray.Count, colCount );
                        sw.WriteLine( "Buffer := {0}\r\n", buffer );

                        swSQL.WriteLine( "--Column Mismatch   current/table : {0}/{1}", tArray.Count, colCount );
                        swSQL.WriteLine( "--Buffer := {0}", buffer );
                        swSQL.WriteLine( "{0}\r\n--SPLIT--\r\n", sqlInsertStatement );
                     }
                  }
               }

               #endregion

               swSQL.WriteLine( "--ENDING OF SQL BLOCK\r\n\r\n\r\n" );

               if( lineCount > 0 )
               {
                  Console.Write( "." );
                  totalLineCount += lineCount;
                  lineCount = 0;
               }

               Console.WriteLine( "{0} Rows Inserted", totalLineCount );
               sw.WriteLine( "{0} Rows Inserted", totalLineCount );
            }

            isSuccess = true;
         }
         else if( fi.Exists )
         {
            fs = new FileStream( @"D:\Temp\Output\" + di.Name + "-ImportErrors.log", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite );
            sw = new StreamWriter( fs );
            sw.AutoFlush = true;

            fsSQL = new FileStream( @"D:\Temp\Output\" + di.Name + "-ImportErrors.sql", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite );
            swSQL = new StreamWriter( fsSQL );
            swSQL.AutoFlush = true;

            sw.WriteLine( "Error Log for {0}\r\n", DateTime.UtcNow );
            swSQL.WriteLine( "--Failed SQL Statments {0}\r\n", DateTime.UtcNow );

            Console.WriteLine( fi.Name );

            isSuccess = true;
         }

         TimeSpan tsEnd = new TimeSpan( DateTime.UtcNow.Ticks );
         Console.WriteLine( "Ingestion Time: " + ( tsEnd - tsStart ).ToString() );
         sw.WriteLine( "Ingestion Time: " + ( tsEnd - tsStart ).ToString() );

         sw.Close();
         fs.Close();
         swSQL.Close();
         fsSQL.Close();

         return ( isSuccess );
      }

      public bool IngestFlatFilesBulk( string fileNameOrPath, IngestionType type )
      {
         if( string.IsNullOrEmpty( fileNameOrPath ) )
            return ( false );

         TimeSpan tsStart = new TimeSpan( DateTime.UtcNow.Ticks );
         bool isSuccess = false;

         DirectoryInfo di = new DirectoryInfo( fileNameOrPath );
         FileInfo fi = new FileInfo( fileNameOrPath );

         Console.WriteLine( "Importing Contents into Database for type {0}", type );

         if( di.Exists )
         {
            fs = new FileStream( @"D:\Temp\Output\" + di.Name + "-ImportErrors.log", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite );
            sw = new StreamWriter( fs );
            sw.AutoFlush = true;

            fsSQL = new FileStream( @"D:\Temp\Output\" + di.Name + "-ImportErrors.sql", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite );
            swSQL = new StreamWriter( fsSQL );
            swSQL.AutoFlush = true;

            //fsSQLOut = new FileStream( @"D:\Temp\Output\" + di.Name + "-ManualEntry.sql", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite );
            //swSQLOut = new StreamWriter( fsSQLOut );
            //swSQLOut.AutoFlush = true;

            sw.WriteLine( "Error Log for {0}\r\n", DateTime.UtcNow );
            swSQL.WriteLine( "--Failed SQL Statments {0}\r\n", DateTime.UtcNow );

            foreach( FileInfo file in di.GetFiles( "*.dat" ) )
            {
               Console.WriteLine( file.Name );

               bool fudgeFactor = false;
               int lineCount = 0;
               int totalLineCount = 0;
               StreamReader readFile = file.OpenText();
               string buffer;
               string tableId = file.Name.Split( '.' )[ 0 ].ToUpper().Replace( "_", "" ).Trim();
               string tableIdCheck;
               ArrayList tArray = new ArrayList();
               StringBuilder sqlInsertBlock = new StringBuilder();
               StringBuilder sqlInsertLine = new StringBuilder();

               swSQL.WriteLine( "--BEGINING OF SQL BLOCK FOR {0}\r\n", file.Name );

               #region Read File Contents

               // Read from file until the end
               while( ( buffer = readFile.ReadLine() ) != null )
               {
                  tArray.Clear();

                  // remove the sql killing character '
                  buffer = buffer.Replace( "'", " " );

                  if( buffer.Length == 0 || buffer[ 0 ] == ' ' )
                  {
                     Console.WriteLine( "Warning: Buffer Empty" );
                     continue;
                  }

                  foreach( string buff in buffer.Split( '|' ) )
                     tArray.Add( buff );

                  tableIdCheck = ( string )tArray[ 0 ];

                  if( tableIdCheck != tableId )
                  {
                     Console.WriteLine( "Table Header Mismatch:   Found := {0} | TableID := {1}", tableIdCheck, tableId );
                     sw.WriteLine( "Table Header Mismatch:   Found := {0} | TableID := {1}", tableIdCheck, tableId );
                     sw.WriteLine( "Buffer := {0}\r\n", buffer );
                     continue;
                  }

                  string tableName = GetTableHeader( type ) + tArray[ 0 ];
                  int colCount = GetTableSchemaColCount( tableName );

                  switch( tableName )
                  {
                     case "VACATED_PUBACC_LO":
                        fudgeFactor = true; // Missing FCC Data
                        break;
                     default:
                        fudgeFactor = false; // Missing FCC Data
                        break;
                  }

                  // the data being inserted must match the columns in the database. Look to remote extranious /r/n.
                  while( colCount > tArray.Count )
                  {
                     if( !fudgeFactor )
                     {
                        // append to the buffered read line until it matches the column count.
                        buffer += readFile.ReadLine();

                        // remove the sql killing character '
                        buffer = buffer.Replace( "'", " " );
                     }
                     else
                     {
                        buffer += "|";
                     }

                     tArray.Clear();

                     foreach( string buff in buffer.Split( '|' ) )
                        tArray.Add( buff );

                     //TODO: Figure out a good way to recover this data. Currently it is lost since there are no | at the end of the file.
                     //      For right now data will be lost and will most likely be recorded as a "Table Header Mismatch".
                     //EXAMPLE:BEGIN
                     //SV|1944304|0001359842||EX10|2|ce between consecutive ports approx. 32 miles.
                     //
                     //To operate the ferry vessel we are required to have an inland operators license which is for "inland waters, bays, lakes and sounds.
                     //
                     //Our onboard equipment includes: 1 company cell 'phone, which is always in
                     //SV|1944304|0001359842||EX10|3| range, 2 VHF radios, always in range, One company VHF radio, always in range.  We are no more than 1 hour from port at any time.  We are in close proximity to three U.S.C.G. Bases, (Woods Hole, Menemsha, and Nantucket).  We also have 100% capacity lifera
                     //EXAMPLE:END
                  }

                  if( tArray.Count > 0 )
                  {
                     // prep for sql statement build process.
                     sqlInsertLine.Clear();

                     sqlInsertLine.AppendFormat( "INSERT INTO dbo.{0} VALUES (", tableName );

                     // prep to insert null if the value is empty
                     foreach( string item in tArray )
                     {
                        if( string.IsNullOrEmpty( item.Trim() ) )
                           sqlInsertLine.AppendFormat( "null," );
                        else
                           sqlInsertLine.AppendFormat( "'{0}',", item.Trim() );
                     }

                     sqlInsertLine.Replace( ',', ')', sqlInsertLine.Length - 1, 1 );
                     sqlInsertLine.Append( "\r\n" );

                     if( tArray.Count == colCount )
                     {
                        lineCount++;
                        sqlInsertBlock.Append( sqlInsertLine );
                     }
                     else
                     {
                        Console.WriteLine( "Columns Current / Columns Total : {0}/{1}", tArray.Count, colCount );
                        sw.WriteLine( "Column Mismatch   current/table : {0}/{1}", tArray.Count, colCount );
                        sw.WriteLine( "Buffer := {0}\r\n", buffer );

                        swSQL.WriteLine( "--Column Mismatch   current/table : {0}/{1}", tArray.Count, colCount );
                        swSQL.WriteLine( "--Buffer := {0}", buffer );
                        swSQL.WriteLine( "{0}\r\n--SPLIT--\r\n", sqlInsertLine );
                     }
                  }

                  // bulk insert a block of data
                  if( lineCount > 2500 )
                  {
                     totalLineCount += lineCount;

                     //swSQLOut.WriteLine( sqlInsertBlock );
                     //swSQLOut.WriteLine( "GO\r\n" );

                     dbs.Open(); // open DB connection
                     // do the insert. Max length cannot exceed the size of a long for the sql statment. Can do bulk insert
                     int result = dbs.Execute( sqlInsertBlock.ToString(), false );
                     dbs.Close(); // close the db connection

                     if( result <= 0 )
                     {
                        sw.WriteLine( "File := {0} - ErrorMessage := {1}", file.Name, dbs.LastErrorMessage );
                        swSQL.WriteLine( "{0}\r\n--SPLIT--\r\n", sqlInsertBlock ); // If there are a lot of failures this will slow the machine down.
                     }
                     else
                     {
                        // Show progress
                        Console.Write( "." );
                     }

                     sqlInsertBlock.Clear();

                     lineCount = 0;
                  }
               }
               #endregion

               // finish up the last of the inserts
               if( lineCount > 0 )
               {
                  totalLineCount += lineCount;

                  //swSQLOut.WriteLine( sqlInsertBlock );
                  //swSQLOut.WriteLine( "GO\r\n" );

                  dbs.Open(); // open DB connection
                  // do the insert. Max length cannot exceed the size of a long for the sql statment. Can do bulk insert
                  int result = dbs.Execute( sqlInsertBlock.ToString(), false );
                  dbs.Close(); // close the db connection

                  if( result <= 0 )
                  {
                     sw.WriteLine( "File := {0} - ErrorMessage := {1}", file.Name, dbs.LastErrorMessage );
                  }
                  else
                  {
                     // Show progress
                     Console.Write( "." );
                  }

                  sqlInsertBlock.Clear();
               }

               swSQL.WriteLine( "--ENDING OF SQL BLOCK\r\n\r\n\r\n" );

               // Show progress
               Console.WriteLine( "{0} Rows Inserted", totalLineCount );
               sw.WriteLine( "{0} Rows Inserted", totalLineCount );
            }

            isSuccess = true;
         }
         else if( fi.Exists )
         {
            fs = new FileStream( @"D:\Temp\Output\" + di.Name + "-ImportErrors.log", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite );
            sw = new StreamWriter( fs );
            sw.AutoFlush = true;

            fsSQL = new FileStream( @"D:\Temp\Output\" + di.Name + "-ImportErrors.sql", FileMode.Create, FileAccess.ReadWrite, FileShare.ReadWrite );
            swSQL = new StreamWriter( fsSQL );
            swSQL.AutoFlush = true;

            sw.WriteLine( "Error Log for {0}\r\n", DateTime.UtcNow );
            swSQL.WriteLine( "--Failed SQL Statments {0}\r\n", DateTime.UtcNow );

            Console.WriteLine( fi.Name );

            isSuccess = true;
         }

         TimeSpan tsEnd = new TimeSpan( DateTime.UtcNow.Ticks );
         Console.WriteLine( "Ingestion Time: " + ( tsEnd - tsStart ).ToString() );
         sw.WriteLine( "Ingestion Time: " + ( tsEnd - tsStart ).ToString() );

         sw.Close();
         fs.Close();
         swSQL.Close();
         fsSQL.Close();
         //swSQLOut.Close();
         //fsSQLOut.Close();

         return ( isSuccess );
      }

      private int GetTableSchemaColCount( string tableTitle )
      {
         int colCount = 0;
         string colVal;

         if( ( colVal = ( string )tableColCount[ tableTitle.ToUpper() ] ) != null )
         {
            int.TryParse( colVal, out colCount );
         }

         return ( colCount );
      }

      private static string GetTableHeader( IngestionType type )
      {
         string tableHeader = string.Empty;
         switch( type )
         {
            case IngestionType.Application:
               tableHeader = "PUBACC_APP_";
               break;
            case IngestionType.General:
               tableHeader = "PUBACC_";
               break;
            case IngestionType.Other:
               tableHeader = "";
               break;
            case IngestionType.Owner:
               tableHeader = "OWNER_PUBACC_";
               break;
            case IngestionType.TowerApplication:
               tableHeader = "TOWER_PUBACC_APP_";
               break;
            case IngestionType.Tower:
               tableHeader = "TOWER_PUBACC_";
               break;
            case IngestionType.Vacated:
               tableHeader = "VACATED_PUBACC_";
               break;
            default:
               break;
         }

         return ( tableHeader );
      }

      public string ExtractContents( string fileNameAndPath )
      {
         if( string.IsNullOrEmpty( fileNameAndPath ) )
            return ( fileNameAndPath );

         FileInfo fi = new FileInfo( fileNameAndPath );

         Console.WriteLine( "Extracting Files from" );
         Console.WriteLine( fileNameAndPath );

         if( fi.Extension.ToLower() == ".zip" )
         {
            FastZip fz = new FastZip();
            fz.ExtractZip( fileNameAndPath, fileNameAndPath + ".out", "" );

            return ( fileNameAndPath + ".out" );
         }

         return ( fileNameAndPath );
      }

      public string ProcessDownload( string url, string savePath )
      {
         string fileName = string.Empty;

         //Start the downloading process
         this.DownloadDataFromUrl( url );

         //Get the last part of the url, ie the file name
         if( this._downloadedData != null && this._downloadedData.Length != 0 )
         {
            fileName = url;

            if( fileName.EndsWith( "/" ) )
               fileName = fileName.Substring( 0, fileName.Length - 1 ); //Chop off the last '/'

            fileName = savePath + fileName.Substring( fileName.LastIndexOf( '/' ) + 1 );
         }

         //Take data from memory and save it to the drive
         if( this._downloadedData != null && this._downloadedData.Length != 0 )
         {
            Console.WriteLine( "Saving Data..." );

            //Write the bytes to a file
            Directory.CreateDirectory( savePath );

            FileStream newFile = new FileStream( fileName, FileMode.Create );
            newFile.Write( this._downloadedData, 0, this._downloadedData.Length );
            newFile.Close();

            Console.WriteLine( "Saved Successfully" );
            Console.WriteLine( fileName );
         }
         else
            Console.WriteLine( "No File was Downloaded Yet!" );

         return ( fileName );
      }

      //Connects to a URL and attempts to download the file
      private void DownloadDataFromUrl( string url )
      {
         double progress = 0;
         double progressmax = 0;

         this._downloadedData = new byte[ 0 ];

         try
         {
            //Optional
            Console.WriteLine( "Connecting via HTTP... to {0}", url );

            //Get a data stream from the url
            WebRequest req = WebRequest.Create( url );
            WebResponse response = req.GetResponse();
            Stream stream = response.GetResponseStream();

            //Download in chuncks
            byte[] buffer = new byte[ 1024 ];

            //Get Total Size
            int dataLength = ( int )response.ContentLength;

            //With the total data we can set up our progress indicators
            progressmax = dataLength;
            Console.WriteLine( "Downloading..." );

            //Download to memory
            //Note: adjust the streams here to download directly to the hard drive
            MemoryStream memStream = new MemoryStream();

            while( true )
            {
               //Try to read the data
               int bytesRead = stream.Read( buffer, 0, buffer.Length );

               if( bytesRead == 0 )
               {
                  //Finished downloading
                  progress = progressmax;
                  Console.WriteLine( dataLength.ToString() + "/" + dataLength.ToString() );

                  break;
               }
               else
               {
                  //Write the downloaded data
                  memStream.Write( buffer, 0, bytesRead );

                  //Update the progress bar
                  if( progress + bytesRead <= progressmax )
                  {
                     progress += bytesRead;
                  }
               }
            }

            //Convert the downloaded stream to a byte array
            this._downloadedData = memStream.ToArray();

            //Clean up
            stream.Close();
            memStream.Close();
         }
         catch( Exception )
         {
            //May not be connected to the internet
            //Or the URL might not exist
            Console.WriteLine( "There was an error accessing the URL." );
         }
      }
   }
   #endregion
}
