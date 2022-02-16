package ddw.vo;

//파일 정보가 저장될 VO객체
public class FileInfoVO {

	private String fileName;		//파일 이름
	private long fileSize;			//파일 크기
	private String uploadStatus;	//Upload 성공 여부
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getUploadStatus() {
		return uploadStatus;
	}
	public void setUploadStatus(String uploadStatus) {
		this.uploadStatus = uploadStatus;
	}
	
	
	
}
