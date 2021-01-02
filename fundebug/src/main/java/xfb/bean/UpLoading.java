package xfb.bean;

/**
 * @description:
 * @author: xfb
 * @time: 2020/12/30 16:19
 */
public class UpLoading {
    private String pic_directoryName;

    public UpLoading() {
        super();
    }

    public UpLoading(String pic_directoryName) {
        this.pic_directoryName = pic_directoryName;
    }

    public String getPic_directoryName() {
        return pic_directoryName;
    }

    public void setPic_directoryName(String pic_directoryName) {
        this.pic_directoryName = pic_directoryName;
    }
}
