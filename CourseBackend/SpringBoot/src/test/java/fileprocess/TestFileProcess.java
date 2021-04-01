package fileprocess;

import static org.junit.Assert.*;

import org.junit.Test;

public class TestFileProcess {

	@Test
	public void testPath() {
		assertTrue(FileProcess.pathIsExists());
	}

}
