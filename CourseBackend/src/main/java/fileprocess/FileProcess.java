package fileprocess;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;

public class FileProcess {

	//public final static String PATH = "D:\\Github\\RESTfulAPI\\static-file";
	public final static String PATH = "static-file";
	public final static String VIDEO="\\video";
	public final static String IMAGE="\\image";
	
	public final static String getFullPath(String pathRelative) {
		return PATH + "\\" + pathRelative;
	}

	public static boolean pathIsExists() {
		File fPath = new File(PATH);
		if (!fPath.exists()) {
			System.out.println("PATH not exists");

			return false;

		}

		return true;

	}

	public static boolean fileIsExists(String pathRelative) {
		if (pathIsExists()) {
			String FilePath = PATH + "\\" + pathRelative;
			File fRelative = new File(FilePath);
			if (!fRelative.exists()) {
				System.out.println("File not exists");

				return false;
			}
			return true;

		}
		return false;

	}
	
	public static String encodeFileToBase64(File file) {
	    try {
	    	if(!file.exists()) {
	    		System.out.println("File not exists");
	    		return null;
	    	
	    	}
	        byte[] fileContent = Files.readAllBytes(file.toPath());
	        return Base64.getEncoder().encodeToString(fileContent);
	    } catch (IOException e) {
	        throw new IllegalStateException("could not read file " + file, e);
	    }
	}
	public static String encodeFileToBase64(String filePath) {
	    try {
	    	File file = new  File(PATH+"\\"+filePath);
	    	if(!file.exists()) {
	    		System.out.println("File not exists");
	    		System.out.println(file.getAbsolutePath());
	    		return null;
	    	
	    	}
	        byte[] fileContent = Files.readAllBytes(file.toPath());
	        return Base64.getEncoder().encodeToString(fileContent);
	    } catch (IOException e) {
	        throw new IllegalStateException("could not read file " + filePath, e);
	    }
	}
	
	public static Path getPath(String filename) {
		Path path=Paths.get(PATH, filename);
		return path;
	}
	public static Path getPath(String folderContain,String filename) {
		Path path=Paths.get(PATH+"\\"+folderContain.replace("/", "\\"), filename);
		return path;
	}
	public static Path getPathVideo(String filename) {
		Path path=Paths.get(PATH+VIDEO, filename);
		return path;
	}
	public static void main(String[] args) {
		Path path=getPath("image/avatar/momo.webp");
		File file=path.toFile();
		System.out.println(path);
		System.out.println(file.exists());
	}

}
