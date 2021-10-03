<option>Select State</option>
<% 
String count=request.getParameter("country_id");
System.out.println("Entered Country Id:"+count);
String India[]={"Mumbai", "New Delhi", "Bangalore"};
String Albania[]={"New Yourk", "Los Angeles","California"};
String uk[]={"London", "Manchester", "Liverpool"};
String states[];
if(count.equals("India"))
{
    for(int i=0;i<=2;i++)
    {
    out.print("<option>"+India[i]+"</option>");
    System.out.println("Option "+i+" for India is:"+India[i]);
    }
}
else if(count.equals("Albania"))
{
    for(int i=0;i<Albania.length;i++)
    {
    	out.print("<option>"+Albania[i]+"</option>");
    	System.out.println("Option "+i+" for Albania is:"+Albania[i]);
    }
}
else if(count.equals("uk"))
{
    for(int i=0;i<=2;i++)
    {
    out.print("<option>"+uk[i]+"</option>");
    System.out.println("Option "+i+" for United Kingdom is:"+India[i]);
    }
} 

%>