package fileprocess;

import static org.junit.Assert.*;

import org.junit.Test;

import vn.edu.topedu.fileprocess.FileProcess;

public class TestFileProcess {

	@Test
	public void testPath() {
		assertTrue(FileProcess.pathIsExists());
	}

}
