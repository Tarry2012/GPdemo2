package common;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by tqy on 16/3/17.
 */
public class Page<T> {
    private static final int PAGE_NO = 1;//页码，默认是第一页
    private static final int PAGE_SIZE = 15;//每页显示的记录数，默认是5
    private int pageNo = PAGE_NO;
    private int pageSize = PAGE_SIZE;
    private int totalRecord;//记录总数
    private int totalPage;//总页数
    private List<T> result;//对应的当前页记录

    private Map<String, Object>params = new HashMap<String, Object>();

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;

        int totalPage = (totalRecord % pageSize == 0) ? totalRecord / pageSize : totalRecord / pageSize + 1;
        this.setTotalRecord(totalPage);
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getResult() {
        return result;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }

    public void setResult(List<T> result) {
        this.result = result;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageNo=" + pageNo +
                ", pageSize=" + pageSize +
                ", totalRecord=" + totalRecord +
                ", totalPage=" + totalPage +
                ", result=" + result +
                ", params=" + params +
                '}';
    }
}
