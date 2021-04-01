package vn.edu.topedu.response;

public class MessageResponse {
	private Message message;
	
	
	public MessageResponse(String en, String vi) {
		super();
		this.message = new Message(en,vi);
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public class Message{
		private String en;
		private String vi;
		public String getEn() {
			return en;
		}
		public void setEn(String en) {
			this.en = en;
		}
		public String getVi() {
			return vi;
		}
		public void setVi(String vi) {
			this.vi = vi;
		}
		public Message(String en, String vi) {
			super();
			this.en = en;
			this.vi = vi;
		}
		public Message() {
			super();
		}
		
	}
}
