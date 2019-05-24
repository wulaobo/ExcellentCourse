package com.cuit.realm;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import com.cuit.domain.User;
import com.cuit.service.UserService;


public class ShiroRealm extends AuthorizingRealm{	
	@Resource
	private UserService us;
	
	/**
	 * 为当限前登录的用户授予角色和权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("->>>>>>>this is 用户授权");
		
		String username = (String) principals.getPrimaryPrincipal();
		
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		
		try {
			authorizationInfo.setRoles(us.getRolesByUsername(username));
			System.out.println("此用户的roles："+us.getRolesByUsername(username));
			authorizationInfo.setStringPermissions(us.getPermissionsByUsername(username));
			System.out.println("此用户的permissions"+(us.getPermissionsByUsername(username)));
		} catch (Exception e) {
			
		}
		return authorizationInfo;
	}

	/**
	 * 验证当前登录的用户
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("->>>>>>>this is 用户认证");
		SimpleAuthenticationInfo authenticationInfo = null;
		UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
		String username = usernamePasswordToken.getUsername();
		System.out.println("token的username:"+username);
		User user =  us.getUserByUsername(username);
		if(user!=null){
			System.out.println("数据库存在此用户");
			authenticationInfo = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), this.getName());
			return authenticationInfo;
		}else{
			System.out.println("用户认证未查询到");
			throw new AuthenticationException();
		}
	}}
