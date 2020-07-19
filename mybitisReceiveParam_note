mybatis 

注解@Param
当你使用了使用@Param注解来声明参数时，如果使用 #{} 或 ${} 的方式都可以,当你不使用@Param注解来声明参数时，必须使用使用 #{}方式。如果使用 ${} 的方式，会报错。
不使用@Param注解时，最好传递 Javabean。在SQL语句里就可以直接引用JavaBean的属性，而且只能引用JavaBean存在的属性。
1. 获取参数：

   第一种，mapper interface 未使用注解 @Param
    (1)单参
	
	mybatis中内置了 ==_parameter== 参数来代替参数名
    <select id="batSelect" parameterType="java.lang.String" resultMap="BaseResultMap">
        select * from works1 WHERE id in (${_parameter})
    </select>
	
	<select id="batSelect" parameterType="com.company.project.model.Works1" resultMap="BaseResultMap">
        select * from works1 WHERE id in = #{id}   
    </select>
	
	(2)多参数
	
	public User getUserByNameAndPass(String name,String pass);  
	<select id="getUserByNameAndPass"  resultMap="BaseResultMap" parameterType="Object">
		SELECT * FROM t_user  WHERE  t_name = #{0} and t_pass = #{1}
	</select>
	注释：#{0} 低版本mybatis 
	
	(3)List 或 Array集合参数
	
	public int batchDelUser(List<String> uuidList);
	<delete id="batchDelUser" parameterType="java.util.List">
		DELETE FROM t_user WHERE uuid IN
		<foreach collection="list" index="index" item="uuid" open="(" separator="," close=")">
			#{uuid}
		</foreach>
	</delete>
	
	<delete id="batchDelUser" parameterType="java.util.List">
		DELETE FROM t_user WHERE uuid IN
		<foreach collection="array" index="index" item="uuid" open="(" separator="," close=")">
			#{uuid}
		</foreach>
	</delete>
	
	(4) 对象
	
	public int updateUser(User user);   
	<select id="updateUser"  resultMap="BaseResultMap" parameterType="Object">
		update t_user set t_name = #{name}, t_pass = #{pass} where uuid=#{uuid}
	</select>	
	
	第二种，使用@Param注解
	
	(1)单参
	
	public interface Works1Mapper extends Mapper<Works1> {
        List<Works1> batSelect(@Param("abc")String ids);
    }
	<select id="batSelect" parameterType="java.lang.String" resultMap="BaseResultMap">
      //都不会报错
        select * from works1 WHERE id in (#{abc}) 
        select * from works1 WHERE id in (${abc})  
    </select>
	
	(2)多参数
	
	public User getUserByNameAndPass(@Param("name") String name, @Param("pass")String pass);  
	<select id="getUserByNameAndPass"  resultMap="BaseResultMap" parameterType="Object">
		SELECT * FROM t_user  WHERE  t_name = #{param1} and t_pass = #{param2}
		SELECT * FROM t_user  WHERE  t_name = #{name} and t_pass = #{pass}
		SELECT * FROM t_user  WHERE  t_name = '${name}' and t_pass = ${pass}
	</select>

    (3)获取对象中的值
	
     直接使用对象内的属性取值，如Works1对象中有个id属性.这时候#{}和${}都不会报错
	
	(3)Map参数
	
	使用@Param注解,可用自定义变量
	public User getUserByMap(Map<String,Object> map);
	<select id="getUserByMap"  resultMap="BaseResultMap" parameterType="java.util.Map">
		SELECT * FROM t_user  WHERE  t_name = #{name} and t_pass = #{pass}
	</select>
	
	(4)实体对象参数
	
	public interface Works1Mapper extends Mapper<Works1> {
		List<Works1> QueryAllByBean(@Param("wk") Works1 works);
    }
	<select id="QueryAllByBean"  resultMap="BaseResultMap">
        select * from works1 where id = #{wk.id};
    </select>
	
	//JAVA 代码
	public List<Group> getUserRoleRelByUserUuid(@Param("groupUuid") String userUuid,@Param("roleList")List<String> roleUuidList);
	//SQL
	SELECT * from user_role where groupUuid=#{groupUuid}
		<choose>
			<when test="roleList!=null&amp;&amp;roleList.size()&gt;0">
				AND roleUuid IN
				<foreach collection="roleList" index="index" item="roleUuid" open="(" separator="," close=")">
					#{roleUuid}
				</foreach>
			</when>
			<otherwise>
				AND roleUuid IN ('')
			</otherwise>
		</choose>
	
2. 用#{}取值时会默认加上双引号 ''
    (1) 区别：
    首先清楚一点，动态 SQL 是 mybatis 的强大特性之一，在 mapper 中定义的参数传到 xml 中之后，在查询之前 mybatis 会对其进行动态解析，#{} 和 ${} 在预编译中的处理是不一样的：
    例如：select * from t_user where userName = #{name};
    #{}预编译：用一个占位符 ? 代替参数:select * from t_user where userName = ?
    #{}预编译：会将参数值一起进行编译：select * from t_user where userName = 'zhangsan'
    (2) 使用场景：
    一般情况首选#{}，因为这样能避免sql注入；如果需要传参 动态表名、动态字段名时，需要使用${}
    比如：select * from ${tableName} where id > #{id};
    (3) SQL注入问题：
    举个例子，如果使用${}出现的注入问题：
    select * from ${tableName};
    如果传参 t_user;delete from t_user，则预编译后的sql如下，将会导致系统不可用：
    select * from t_user;delete from t_user;
    (4) like 语句防注入：
    使用concat函数：
    select * from t_user where name like concat('%', #{name}, '%')

3. mysql字段类型转换
	mysql会自动转换：当你类型为int 但传入的值为varchar 他会把前几个'数字挑出来'转换为int 类型来进行查询
	
	如果你的 aid = 1  你查询语句是SELECT * FROM 表名 WHERE aid='1dasd';
	在编译的时候，编译器会把  1   挑出来进行转换，在进行查询，
		
	如果你的 aid = 1     你查询语句是SELECT * FROM 表名 WHERE aid='dasd';  
	第一个不为数字，所以无法转换，查询出来的结果就为空(不会报错)，     

	如果你的 aid = 1     你查询语句是SELECT * FROM 表名 WHERE aid='123da';
	在编译的时候，编译器会把  123   挑出来进行转换，在进行查询，但查询结果为空（找不到这个对应的id）；

	如果你的 aid = 1     你查询语句是SELECT * FROM 表名 WHERE aid='da1sd';
	查询结果为空，因为编译期是从第一个开始查看是否为数字，如果不是不会往后查；
		
4. 模糊查询concat:
	SELECT * FROM tableName WHERE name LIKE CONCAT(CONCAT('%', #{text}), '%');
	<select id="getMaxSerialCode" resultType="java.lang.String"  parameterType="Object">
        SELECT count(*) FROM
        itil_publish_order
        WHERE serial_code LIKE CONCAT('%',#{codeStr},'%')
        ORDER BY serial_code DESC LIMIT 1
	</select>
