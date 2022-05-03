using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace ULSDatabaseImport
{
   #region Error Status Codes

   /// <summary>
   /// Return Error Codes for DBAccess Layer
   /// </summary>
   public enum ErrorCodes
   {
      OK,
      False,
      SqlGetCritFailed,
      SqlInsertFailed,
      SqlInsertCritFailed,
      SqlReturnedEmptySet,
      SqlUpdateFailed,
      SqlUpdateCritFailed,
      SqlUnexpectedFailure,
      InvalidFunctionCallOrder
   }

   #endregion

   #region DBScripting

   /// <summary>
   /// This class allows direct sql statments to be executed vs the sql engine
   /// </summary>
   public class DBScripting
   {
      private readonly SqlConnection _sqlConnection = new SqlConnection();

      /// <summary>
      /// No Default constructor set. Must use the overloaded constructor
      /// </summary>
      private DBScripting()
      {
         // unused
      }

      /// <summary>
      /// Base Constructor
      /// </summary>
      /// <param name="connectionString"></param>
      public DBScripting( string connectionString )
      {
         this._sqlConnection.ConnectionString = connectionString;
         //_sqlConnection.ConnectionTimeout = 0;
      }

      public string LastErrorMessage { get; set; }
      public ErrorCodes LastErrorCode { get; set; }

      /// <summary>
      /// Return the sql data object
      /// </summary>
      /// <returns></returns>
      public SqlConnection GetSQLConnectionObject()
      {
         return ( this._sqlConnection ); // returns a database connection object
      }

      /// <summary>
      /// Returns the Exact Database State
      /// </summary>
      /// <returns></returns>
      public ConnectionState GetDBConnectionState()
      {
         return ( this._sqlConnection.State );
      }

      /// <summary>
      /// Attemps to open a sql connection
      /// </summary>
      /// <returns></returns>
      public bool Open()
      {
         try
         {
            if( this._sqlConnection.State == ConnectionState.Closed )
               this._sqlConnection.Open();
         }
         catch( Exception ex )
         {
            LastErrorMessage = ex.Message;
            LastErrorCode = ErrorCodes.SqlUnexpectedFailure;
         }

         return ( this._sqlConnection.State == ConnectionState.Open );
      }

      /// <summary>
      /// Reports the Database Status
      /// </summary>
      /// <returns></returns>
      public bool IsOpen()
      {
         return ( this._sqlConnection.State == ConnectionState.Open );
      }

      /// <summary>
      /// Attemps to close a sql connection
      /// </summary>
      /// <returns></returns>
      public bool Close()
      {
         try
         {
            if( this._sqlConnection.State == ConnectionState.Open )
               this._sqlConnection.Close();
         }
         catch( Exception ex )
         {
            LastErrorMessage = ex.Message;
            LastErrorCode = ErrorCodes.SqlUnexpectedFailure;
         }

         return ( this._sqlConnection.State == ConnectionState.Closed );
      }

      /// <summary>
      /// Reports the Database Status
      /// </summary>
      /// <returns></returns>
      public bool IsClosed()
      {
         return ( this._sqlConnection.State == ConnectionState.Closed );
      }

      /// <summary>
      /// Executes a sql text statement.
      /// </summary>
      /// <param name="sqlStatement">TSQL command</param>
      /// <param name="dbAutoCloseConnection">Keep the DB Connection Open or Not after execution</param>
      /// <returns></returns>
      public int Execute( string sqlStatement, bool dbAutoCloseConnection )
      {
         LastErrorMessage = string.Empty;
         LastErrorCode = ErrorCodes.OK;
         bool wasAutoOpened = false;

         int dtResult = 0;

         try
         {
            // Auto Open connection if closed.
            if( this._sqlConnection.State == ConnectionState.Closed )
            {
               wasAutoOpened = true;
               this._sqlConnection.Open();
            }

            // Check connection state before proceeding
            if( this._sqlConnection.State != ConnectionState.Open )
            {
               LastErrorMessage = "Connection State Not Open. Connection State = " + this._sqlConnection.State;
               LastErrorCode = ErrorCodes.SqlUnexpectedFailure;

               return ( dtResult );
            }

            #region Execute a SQL query

            using( SqlCommand sqlCommand = new SqlCommand( sqlStatement, this._sqlConnection ) )
            {
               try
               {
                  dtResult = sqlCommand.ExecuteNonQuery();
               }
               catch( System.Exception e )
               {
                  LastErrorMessage = e.Message;
                  LastErrorCode = ErrorCodes.SqlUnexpectedFailure;
               }
            }

            #endregion

            // Close the connection if the dbAutoCloseConnect value is true or if the call auto opened the conncetion
            if( wasAutoOpened || ( dbAutoCloseConnection && this._sqlConnection.State == ConnectionState.Open ) )
            {
               this._sqlConnection.Close();

               // Verify that the connection was closed
               if( this._sqlConnection.State == ConnectionState.Open )
               {
                  LastErrorMessage = "Unable to Close Database Connection. Connection State = " + this._sqlConnection.State;
                  LastErrorCode = ErrorCodes.SqlUnexpectedFailure;
               }
            }
            else if( dbAutoCloseConnection ) // Report an error if the connection state is anything other than Open
            {
               LastErrorMessage = "Connection State Not Open. Connection State = " + this._sqlConnection.State;
               LastErrorCode = ErrorCodes.SqlUnexpectedFailure;
            }
         }
         catch( Exception ex )
         {
            LastErrorMessage = ex.Message;
            LastErrorCode = ErrorCodes.SqlUnexpectedFailure;
         }

         return ( dtResult );
      }
   }

   #endregion
}

