package board;

public class BoardBean {
	private int num; //寃뚯떆湲� 踰덊샇
	private String writer; //�옉�꽦�옄 紐�
	private String pass; //寃뚯떆湲� 鍮꾨�踰덊샇
	private String regdate; //寃뚯떆 �씪�옄 諛� �떆媛�
	private String email; //�옉�꽦�옄 �씠硫붿씪
	private String subject; //寃뚯떆湲� �젣紐�
	private String content; //寃뚯떆湲� �궡�슜
	private int readcnt; //議고쉶�닔
	private int ref; //湲�留덈떎 �떎 �떎由�, 媛숈� �씪�씤 (寃뚯떆湲�, 洹몄쓽 �뙎湲�, 洹몄쓽 �뙎湲�) �몴�떆
	private int ref_step; // �썝湲��� 0, �뙎湲� 蹂댁뿬二쇰뒗 �닚�꽌 sorting 媛�. 媛��옣 理쒓렐�뿉 �벑濡앸맂 寃껋씠 �뜑 �궙�� 媛�, 
	private int re_level; //�젣紐⑹쓽 �뙎湲� �젅踰�, 洹몃윭�땲源� �븳 寃뚯떆臾쇱� �젅踰� 0, 洹몄쓽 �뙎湲��� �젅踰� 1, 洹� �뙎湲��쓽 �뙎湲��쓽 �젅踰� 2. �씠�윴 �삎�떇�쑝濡� �뙎湲��쓽 �젅踰⑥쓣 �븣�젮以�
	private String ip; //
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRef_step() {
		return ref_step;
	}
	public void setRef_step(int ref_step) {
		this.ref_step = ref_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
}
