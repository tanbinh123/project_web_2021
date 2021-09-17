package vn.edu.topedu.xuggler;

import java.io.IOException;
import java.io.RandomAccessFile;

import com.xuggle.xuggler.io.IURLProtocolHandler;

public class CStore implements IURLProtocolHandler{
	RandomAccessFile raf;
	 public CStore(RandomAccessFile raf) {
		this.raf=raf;
	}
	@Override
	public int close() {
		System.out.println("close");
		try {
			raf.close();
			return 0;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return 1;
	}

	@Override
	public boolean isStreamed(String arg0, int arg1) {
		return false;
	}

	@Override
	public int open(String url, int flags) {
		 // if url is not a hdfs-url then return negative value to indicate
        // failure
		System.out.println(url);
        
       
//        if (url != null && !url.startsWith("hdfs:"))
//            return -1;

//        if( url != null )
//            pile = new Path(url);
//        
//        if( pile == null ) return -1;
//        
//        try {
//            fs = pile.getFileSystem(conf);
//            fIn = fs.open(pile);
//        } catch (IOException e) {
//           
//            System.out.println("Not open");
//            return -2;
//        }
        
      
        System.out.println(" open");
        return 0;
	}

	@Override
	public int read(byte[] buf, int size) {
		
		  int r = 0;
	        try {
	            r = raf.read(buf, 0, size);
	           
	            if( r < size )
	            {
	                int r2 = raf.read(buf, r, size - r );
	                if( r2 >= 0 )
	                    r += r2;
	            }

	            
	            if (r == -1)
	                r = 0;

	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	            r = -1;
	        }
	        System.out.println("read = "+r);
	        return r;
	    
	}

	@Override
	public long seek(long offset, int whence) {
		
		System.out.println("seeking to " + offset + ", whence = " + whence );
		long pos;
        try {
            //FileStatus status = fs.getFileStatus(pile);
            long len =raf.length();
            System.out.println("len = "+len);
           // raf.get
            switch (whence) {
            case SEEK_CUR:
                long old_pos = raf.getFilePointer();
                raf.seek(old_pos + offset); 
                pos = old_pos - raf.getFilePointer();
                break;
            case SEEK_END:
            	raf.seek( len + offset );
                pos = raf.getFilePointer() - len;
                break;
            case SEEK_SIZE:
            	
//            	pos= 0;
                pos = len;
                break;
            case SEEK_SET:
            default:
            	raf.seek( offset ); 
                pos = raf.getFilePointer();
                break;
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
           
            //e.printStackTrace();
            return -1;
        } 
        System.out.println("pos = "+pos);
        return pos;
	}

	@Override
	public int write(byte[] arg0, int arg1) {
		// TODO Auto-generated method stub
		return 0;
	}

}
