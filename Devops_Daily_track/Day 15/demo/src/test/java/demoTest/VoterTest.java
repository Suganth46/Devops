package demoTest;

	import static org.junit.Assert.assertEquals;

	import org.junit.Test;

import demo.Vote;

	public class VoterTest {

		@Test
		public void eligibleTest() {
			Vote v=new Vote();
			String res=v.eligible(17);
			assertEquals("NO",res);
			res=v.eligible(20);
			assertEquals("YES",res);
		}
	}

