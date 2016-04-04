package common;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;

import java.lang.annotation.Annotation;
import java.util.Properties;

/**
 * Created by tqy on 16/3/18.
 */
@Intercepts({@Signature(
        type= Executor.class,
        method = "update",
        args = {MappedStatement.class,Object.class})})
public class pluginsTest implements Interceptor {
    public Object intercept(Invocation invocation) throws Throwable {
        System.out.println("hello!");
        return invocation.proceed();
    }
    public Object plugin(Object target) {
        return Plugin.wrap(target,this);
    }
    public void setProperties(Properties properties) {
    }

}
