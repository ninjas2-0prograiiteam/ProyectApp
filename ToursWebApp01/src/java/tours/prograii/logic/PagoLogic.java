package tours.prograii.logic;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import tours.prograii.database.DatabaseX;
import tours.prograii.objects.PagoObj;

public class PagoLogic extends Logic
{
    
    public boolean insertPagoBool(int p_iIdUsuario, int p_iNodeTarjeta, int p_iCvv, int p_iFechadeVencimiento) 
    {
        //INSERT INTO tourdatabase.pago
        DatabaseX database = getDatabase();
        String strSql = "INSERT INTO tourdatabase.pago(id,idusuario,nodetarjeta,cvv,fechadevencimiento)"
                + "VALUES(0,0,"+p_iNodeTarjeta+","+p_iCvv+","+p_iFechadeVencimiento+")";
        System.out.println(strSql);
        boolean bsuccess = database.executeNonQueryBool(strSql);
        return bsuccess;
    }
    
    public int insertPagoRows(int p_iIdUsuario, int p_iNodeTarjeta, int p_iCvv, int p_iFechadeVencimiento)
    {
        //INSERT INTO tourdatabase.pago
        DatabaseX database = getDatabase();
        String strSql = "INSERT INTO tourdatabase.pago(id,idusuario,nodetarjeta,cvv,fechadevencimiento)"
                + "VALUES(0,0,"+p_iNodeTarjeta+","+p_iCvv+","+p_iFechadeVencimiento+")";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }
    
    //metodo array
    public ArrayList<PagoObj> getAllPagos() 
    {
        DatabaseX database = getDatabase();
        String strSql = "select * from tourdatabase.pago ";
        System.out.println(strSql);
        ResultSet CResult = database.executeQuery(strSql);
        ArrayList<PagoObj> CArray = null;
        
        if(CResult!=null)
        {
            int iId;
            int iIdUsuario;
            int iNodeTarjeta;
            int iCvv;
            int iFechadeVencimiento;
            
            PagoObj CTemp;
            CArray = new ArrayList<>();
            
            try 
            {
                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    iIdUsuario = CResult.getInt("idusuario");
                    iNodeTarjeta = CResult.getInt("nodetarjeta");
                    iCvv = CResult.getInt("cvv");
                    iFechadeVencimiento = CResult.getInt("fechadevencimiento");
                    
                    CTemp = new PagoObj(iId, iIdUsuario, iNodeTarjeta, iCvv, iFechadeVencimiento);
                    CArray.add(CTemp);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(PagoLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return CArray;
        
    }
    
    public PagoObj getPagoById(int p_iId) 
    {
        DatabaseX database = getDatabase();
        String strSql = "select * from tourdatabase.pago where id="+p_iId+" ";
        System.out.println(strSql);
        ResultSet CResult = database.executeQuery(strSql);
        PagoObj CTemp = null;
        
        if(CResult!=null)
        {
            int iId;
            int iIdUsuario;
            int iNodeTarjeta;
            int iCvv;
            int iFechadeVencimiento;
            
            try 
            {
                while(CResult.next())
                {
                    iId = CResult.getInt("id");
                    iIdUsuario = CResult.getInt("idusuario");
                    iNodeTarjeta = CResult.getInt("nodetarjeta");
                    iCvv = CResult.getInt("cvv");
                    iFechadeVencimiento = CResult.getInt("fechadevencimiento");
                    
                    CTemp = new PagoObj(iId, iIdUsuario, iNodeTarjeta, iCvv, iFechadeVencimiento);
                }
            } 
            catch (SQLException ex) 
            {
                Logger.getLogger(PagoLogic.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return CTemp;
        
    }

    public int borrarPagoRows(int p_iId) 
    {
        DatabaseX database = getDatabase();
        String strSql = "delete from tourdatabase.pago(id,idusuario,nodetarjeta,cvv,fechadevencimiento)"
                + "where id = "+p_iId+" ";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }
    
    public int updatePagoRows(int p_iId, int p_iIdUsuario, int p_iNodeTarjeta, int p_iCvv, int p_iFechadeVencimiento) 
    {
        DatabaseX database = getDatabase();
        String strSql = "update tourdatabase.pago "
                + "set idusuario = "+p_iIdUsuario+", nodetarjeta = "+p_iNodeTarjeta+", cvv = "+p_iCvv+", fechadevencimiento = "+p_iFechadeVencimiento+" "
                + "where id = "+p_iId+" ";
        System.out.println(strSql);
        int iRows = database.executeNonQueryRows(strSql);
        return iRows;
    }
}
  
    
  