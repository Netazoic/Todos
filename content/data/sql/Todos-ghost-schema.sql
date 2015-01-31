
-- Table: do_class
CREATE TABLE do_class ( 
    dccode      VARCHAR( 10 )   PRIMARY KEY,
    dcname      VARCHAR( 25 ),
    dcdesc      VARCHAR( 128 ),
    dcdb        VARCHAR( 25 ),
    dctable     VARCHAR( 25 ),
    dc_pk_fld   VARCHAR( 25 ),
    dc_uuid_fld VARCHAR( 25 ) 
);

INSERT INTO [do_class] ([dccode], [dcname], [dcdesc], [dcdb], [dctable], [dc_pk_fld], [dc_uuid_fld]) VALUES ('EO', 'EO', 'EO', null, null, null, null);
INSERT INTO [do_class] ([dccode], [dcname], [dcdesc], [dcdb], [dctable], [dc_pk_fld], [dc_uuid_fld]) VALUES ('DO', 'DO', 'Base DO', null, 'posts', 'id', 'uuid');

-- Table: posts
CREATE TABLE posts ( 
    id               INTEGER         NOT NULL
                                     PRIMARY KEY AUTOINCREMENT,
    uuid             VARCHAR( 36 )   NOT NULL,
    title            VARCHAR( 150 )  NOT NULL,
    slug             VARCHAR( 150 )  NOT NULL,
    markdown         TEXT            NULL,
    html             TEXT            NULL,
    image            TEXT            NULL,
    featured         BOOLEAN         NOT NULL
                                     DEFAULT '0',
    page             BOOLEAN         NOT NULL
                                     DEFAULT '0',
    status           VARCHAR( 150 )  NOT NULL
                                     DEFAULT 'draft',
    language         VARCHAR( 6 )    NOT NULL
                                     DEFAULT 'en_US',
    meta_title       VARCHAR( 150 )  NULL,
    meta_description VARCHAR( 200 )  NULL,
    author_id        INTEGER         NOT NULL,
    created_at       DATETIME        NOT NULL,
    created_by       INTEGER         NOT NULL,
    updated_at       DATETIME        NULL,
    updated_by       INTEGER         NULL,
    published_at     DATETIME        NULL,
    published_by     INTEGER         NULL 
);

INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (1, 'cb4e0c17-299c-4982-a83c-887b3ba65dd1', 'Welcome to the new blog', 'welcome-to-ghost', '> Wisdomous - it''s definitely a word.

This is a blog about creating an app.  The app is going to be called ''Todos'', as in, things that need to be done, or as in "Everything", as they say in Espa&ntilde;ol.  (How do I get an e&ntilde;e -- question number one but I am not going to stop and Google that now.)(I googled it.)

## Where We Start
There are lots of todo apps out there. I currently use Wunderlist. It''s ok. It''s just ok.

We need something better.
![picture of something better](/content/images/2014/10/birthdayporcupine.jpg)

So, I am starting with Ghost!  Why ghost.  Well, ghost is cool.  It is open source, dedicated to simplicity of design and purpose, and basically it is supposed to replace WordPress. Sure, they won''t say that. But let''s face it, WordPress is everything that is wrong with application development these days.  

     <rant>It is built in php. In 2014 it is built in php! It is a bloated hogbeast. And it is used by millions of people. Who don''t seem to know any better. I admit, I have spent my fair share of time in php development land (hell).  It never works out well, but *everyone* is there.</rant>

Anyway, we aren''t doing that anymore. Here''s to ghost.  But am I actually talking about building something *on top* of ghost? Probably not. That would be taking ghost down the same path as WordPress, would it not? Don''t want to do that!

But ghost is where I am going to record the process. This is going to be an opensource project - maybe with a total of 1 developers but that''s ok :)  And this is where I am going to chronicle it.

## So Where Are We?
So far, we have a DigitalOcean VPS, running CentOS.  We have a ghost install, which implies nginx. I also have an apache web server and a tomcat install, just because. We have a sub-domain (ghost.netazoic.com) pointed at the VPS.

Ghost is running in its default SQLite mode.  I spent some time trying to get it up in Postgresql before realizing that ghost 0.5 really isn''t very postgres friendly.  We will probably revisit that later. But it occurred to me: the end goal is to create an app that can run on the web and on Android, so getting some SQLite experience is necessarily a bad thing.', '<blockquote>
  <p>Wisdomous - it''s definitely a word.</p>
</blockquote>

<p>This is a blog about creating an app.  The app is going to be called ''Todos'', as in, things that need to be done, or as in "Everything", as they say in Espa&ntilde;ol.  (How do I get an e&ntilde;e -- question number one but I am not going to stop and Google that now.)(I googled it.)</p>

<h2 id="wherewestart">Where We Start</h2>

<p>There are lots of todo apps out there. I currently use Wunderlist. It''s ok. It''s just ok.</p>

<p>We need something better. <br />
<img src="/content/images/2014/10/birthdayporcupine.jpg" alt="picture of something better" /></p>

<p>So, I am starting with Ghost!  Why ghost.  Well, ghost is cool.  It is open source, dedicated to simplicity of design and purpose, and basically it is supposed to replace WordPress. Sure, they won''t say that. But let''s face it, WordPress is everything that is wrong with application development these days.  </p>

<pre><code> &lt;rant&gt;It is built in php. In 2014 it is built in php! It is a bloated hogbeast. And it is used by millions of people. Who don''t seem to know any better. I admit, I have spent my fair share of time in php development land (hell).  It never works out well, but *everyone* is there.&lt;/rant&gt;
</code></pre>

<p>Anyway, we aren''t doing that anymore. Here''s to ghost.  But am I actually talking about building something <em>on top</em> of ghost? Probably not. That would be taking ghost down the same path as WordPress, would it not? Don''t want to do that!</p>

<p>But ghost is where I am going to record the process. This is going to be an opensource project - maybe with a total of 1 developers but that''s ok :)  And this is where I am going to chronicle it.</p>

<h2 id="sowherearewe">So Where Are We?</h2>

<p>So far, we have a DigitalOcean VPS, running CentOS.  We have a ghost install, which implies nginx. I also have an apache web server and a tomcat install, just because. We have a sub-domain (ghost.netazoic.com) pointed at the VPS.</p>

<p>Ghost is running in its default SQLite mode.  I spent some time trying to get it up in Postgresql before realizing that ghost 0.5 really isn''t very postgres friendly.  We will probably revisit that later. But it occurred to me: the end goal is to create an app that can run on the web and on Android, so getting some SQLite experience is necessarily a bad thing.</p>', null, 0, 0, 'published', 'en_US', null, null, 1, 1412142638138, 1, 1416845583856, 1, 1412142638154, 1);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (2, '53637fd1-13d1-4c76-a956-0b3479d93303', 'About', 'about', '<div class="column1">
            
<h2>We like to build things</h2>
                
<p>The web is a wide-open place. A place where you can 
                build as wide and as big as your imagination can carry you.
                Is it the last frontier? Maybe, maybe not (let''s hope not). 
                But it is the frontier of our generation.</p>
                
<p>What do you want to build?</p>

</div>
<div class="column2">
            	
<h2>How we build</h2>
                
<p>This thing we call the Internet: an ever-changing sea of new and old technologies.  Some
                  things come and go (ASP, Perl, Cobol), some things stay around
                  forever (C, Java, Cobol).  And some things just defy all logic
                  in their ability to grow ever deeper into the fabric of the net,
                  (JavaScript, PHP). Like weeds?
                 </p>
                 <p>We like to use proven technologies, with a bias towards open-source.
                 We tend to be a little more on the practical side than the cutting-edge, 
                 but in this landscape you can''t stand still, so we are always learning.
                 </p>
                 <h4>Things we like now:</h4>
                 <p>Linux, git, (thanks, Linus), Java, JavaScript, jQuery, Dojo,
                 Postgresql, sqlLite, Apache</p>
                 <h4>Things we are looking at for the future:</h4>
                 <p>node.js, angular.js, nginx 
                	
</div>
<div class="column3">
            
<h2>Recent work</h2>
            
            	<ul class="work">
                	<li>
                    	<a href="/project-calendar-creator" class="work-link">
![](/content/images/2014/11/calendar1.jpg)
<h4>Dates Will Be With Us to the End: A Calendar App Using jQuery</h4>
							
                        </a>
                    </li>
                    <li>
                    	<a href="/project-custom-forms" class="work-link">
![](/content/images/2014/11/forms3.jpg)
<h4>Custom Forms: Still a Need for Custom Forms in a Robo-Form World?</h4>
						</a>
                    </li>
                    <li>
<a href="/project-newsletter-creation-tool" class="work-link">
![](/content/images/2014/11/typewriter.jpg)

                            <h4>Newsletter Creation Tool for the Enterprise</h4>
							
                        </a>
                    </li>
                </ul>
            	
</div>
', '<div class="column1">

<h2>We like to build things</h2>

<p>The web is a wide-open place. A place where you can  
                build as wide and as big as your imagination can carry you.
                Is it the last frontier? Maybe, maybe not (let''s hope not). 
                But it is the frontier of our generation.</p>

<p>What do you want to build?</p>

</div>  

<div class="column2">

<h2>How we build</h2>

<p>This thing we call the Internet: an ever-changing sea of new and old technologies.  Some  
                  things come and go (ASP, Perl, Cobol), some things stay around
                  forever (C, Java, Cobol).  And some things just defy all logic
                  in their ability to grow ever deeper into the fabric of the net,
                  (JavaScript, PHP). Like weeds?
                 </p>
                 <p>We like to use proven technologies, with a bias towards open-source.
                 We tend to be a little more on the practical side than the cutting-edge, 
                 but in this landscape you can''t stand still, so we are always learning.
                 </p>
                 <h4>Things we like now:</h4>
                 <p>Linux, git, (thanks, Linus), Java, JavaScript, jQuery, Dojo,
                 Postgresql, sqlLite, Apache</p>
                 <h4>Things we are looking at for the future:</h4>
                 <p>node.js, angular.js, nginx 

</div>  

<div class="column3">

<h2>Recent work</h2>

                <ul class="work">
                    <li>
                        <a href="/project-calendar-creator" class="work-link">
<img src="/content/images/2014/11/calendar1.jpg" alt="" />
<h4>Dates Will Be With Us to the End: A Calendar App Using jQuery</h4>

                        </a>
                    </li>
                    <li>
                        <a href="/project-custom-forms" class="work-link">
<img src="/content/images/2014/11/forms3.jpg" alt="" />
<h4>Custom Forms: Still a Need for Custom Forms in a Robo-Form World?</h4>  
                        </a>
                    </li>
                    <li>
<a href="/project-newsletter-creation-tool" class="work-link">  
<img src="/content/images/2014/11/typewriter.jpg" alt="" />

                            <h4>Newsletter Creation Tool for the Enterprise</h4>

                        </a>
                    </li>
                </ul>

</div>', null, 0, 1, 'published', 'en_US', null, null, 1, 1412731257380, 1, 1416430485681, 1, 1412731310283, 1);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (3, 'b33fa2ac-d349-41ee-ba7c-2d3a8d7798d7', 'Todhos', 'todhos', 'It occurs to me -- maybe the reason no one has taken Todos as an app name is because MS is excercising crazy trademark protection around the letters D O S in an application name.  Could it be that if you try to make anything with the name `_DOS` you run afoul of the mighty Redmond monolith?  I don''t know if this is true or not, but it got me to thinking.  And another thought was coming to me last night -- why not build an initial version on top of Ghost?  

      Warning! Warning! Slippery Slope!

Oh well, the thought is out of the bag:  Why not give Ghost some CMS features? Just little ones. Just a little Todos. 

In which case would it be . . . Todhos?  Tohdhos?  Tohdos (dos alert)?  I think maybe Todhos works best.', '<p>It occurs to me -- maybe the reason no one has taken Todos as an app name is because MS is excercising crazy trademark protection around the letters D O S in an application name.  Could it be that if you try to make anything with the name <code>_DOS</code> you run afoul of the mighty Redmond monolith?  I don''t know if this is true or not, but it got me to thinking.  And another thought was coming to me last night -- why not build an initial version on top of Ghost?  </p>

<pre><code>  Warning! Warning! Slippery Slope!
</code></pre>

<p>Oh well, the thought is out of the bag:  Why not give Ghost some CMS features? Just little ones. Just a little Todos. </p>

<p>In which case would it be . . . Todhos?  Tohdhos?  Tohdos (dos alert)?  I think maybe Todhos works best.</p>', null, 0, 0, 'published', 'en_US', null, null, 1, 1412870892338, 1, 1416845560133, 1, 1412870914481, 1);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (4, '8a0616d6-c815-43ea-b386-b22d64c7a106', 'Pardon This Interruption', 'pardon-this-interruption', 'I am going to put up some marketing-type stuff over the next couple of weeks. Hopefully some of it will be interesting.  I am even creating a slideshow [see it here](/universum) just to add some sizzle to this site for purposes of shopping for constulting gigs. So, hold tight for a bit.  Todos will be coming back soon.', '<p>I am going to put up some marketing-type stuff over the next couple of weeks. Hopefully some of it will be interesting.  I am even creating a slideshow <a href="/universum">see it here</a> just to add some sizzle to this site for purposes of shopping for constulting gigs. So, hold tight for a bit.  Todos will be coming back soon.</p>', null, 0, 0, 'published', 'en_US', null, null, 1, 1412886485104, 1, 1416603297155, 1, 1412886512097, 1);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (5, '90f00f2d-d384-44d3-b00a-43d4732d9100', 'A Project Description', 'project1', '#This is a Great Project!

What fun we had!
Can''t wait for the pictures', '<h1 id="thisisagreatproject">This is a Great Project!</h1>

<p>What fun we had! <br />
Can''t wait for the pictures</p>', null, 0, 1, 'published', 'en_US', null, null, 1, 1412887883040, 1, 1412887949259, 1, 1412887883050, 1);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (6, 'ea31ab23-8fb3-4b3b-84d4-e5aedb311662', 'Universum', 'universum', '
<div class="column1">
<a href="#" name="info"></a>            
<h2>a picture is worth a thousand words</h2>
                
<p>The <a href="http://en.wikipedia.org/wiki/Flammarion_engraving">Flammarion Engraving</a>, 
               also known as "Urbi et Orbi" (The City and the Universe) is a classic take on the 
               change in human understanding between the Middle Ages and the Renaissance.
               We update it here with a take for the current age, the age of the network. Where do
               we go from here?  Does the Age of Reason lead us to pure materialism, or do we rediscover
               an essential mystery at the heart of life, and being?</p>

</div>
<div class="column2">
            	
                <h2>the changing web slide show</h2>
                
                <p>There are a million slide show programs for delivering
                the homepage slideshow. Literally, a million (ok, a thousand).  This page is
                rendered with javascript and css (as opposed to the old 
                standard flash-based solutions), using the fantastic 
                <a href="http://julian.com/research/velocity/">velocity.js</a> 
                animation library. It is home-rolled - we eat our own dogfood here
                as much as possible. We hope you like it.</p>
                	
</div>
<div class="column3">
            
            	
            	
            </div>

<div id="slide-loader" >
![](/content/images/2014/11/slide_universum_stars.png)
</div>
<script>
flgTitle = false;
flgNoBorder = true;
</script>', '<div class="column1">  
<a href="#" name="info"></a>  
<h2>a picture is worth a thousand words</h2>

<p>The <a href="http://en.wikipedia.org/wiki/Flammarion_engraving">Flammarion Engraving</a>,  
               also known as "Urbi et Orbi" (The City and the Universe) is a classic take on the 
               change in human understanding between the Middle Ages and the Renaissance.
               We update it here with a take for the current age, the age of the network. Where do
               we go from here?  Does the Age of Reason lead us to pure materialism, or do we rediscover
               an essential mystery at the heart of life, and being?</p>

</div>  

<div class="column2">

                <h2>the changing web slide show</h2>

                <p>There are a million slide show programs for delivering
                the homepage slideshow. Literally, a million (ok, a thousand).  This page is
                rendered with javascript and css (as opposed to the old 
                standard flash-based solutions), using the fantastic 
                <a href="http://julian.com/research/velocity/">velocity.js</a> 
                animation library. It is home-rolled - we eat our own dogfood here
                as much as possible. We hope you like it.</p>

</div>  

<div class="column3">



            </div>

<div id="slide-loader" >  
<img src="/content/images/2014/11/slide_universum_stars.png" alt="" />
</div>  

<script>  
flgTitle = false;  
flgNoBorder = true;  
</script>', '/content/images/2014/11/slide_universum_stars_800x500.jpg', 0, 0, 'published', 'en_US', null, null, 1, 1416244513410, 1, 1416848611564, 1, 1416244560000, 1);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (7, '90476938-cb6c-4dd3-88d4-568924cdf96d', 'Slideshow Main', 'slideshow', 'See page-slideshow', '<p>See page-slideshow</p>', null, 0, 1, 'published', 'en_US', null, null, 1, 1416291261060, 1, 1416292712522, 1, 1416291297263, 1);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (8, 'f973ba03-3c9b-4875-8c91-e6fa226a91e2', 'Contact Us', 'contact', '<div class="column1">
![](/content/images/2014/11/message_in_a_bottle.jpg)


					</div>

<div class="column2">
	<h2>Please get in touch</h2>

We''ll admit it -- we''re a little old school.
	Our favorite means of communication: good old email.
	
		<div class="work">
		<ul class="work">
			<li><a href="mailto:jomofrodo@gmail.com"> 
					<h4>John Moore -- jomofrodo@gmail.com</h4>

			</a></li>
		</ul>

	</div>
</div>

', '<div class="column1">  
<img src="/content/images/2014/11/message_in_a_bottle.jpg" alt="" />


                    </div>

<div class="column2">  
    <h2>Please get in touch</h2>

We''ll admit it -- we''re a little old school.  
    Our favorite means of communication: good old email.

        <div class="work">
        <ul class="work">
            <li><a href="mailto:jomofrodo@gmail.com"> 
                    <h4>John Moore -- jomofrodo@gmail.com</h4>

            </a></li>
        </ul>

    </div>
</div>', null, 0, 1, 'published', 'en_US', null, null, 1, 1416293752909, 1, 1416430424878, 1, 1416293880759, 1);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (10, '2b11521f-52e5-4246-974b-dbccbc8da0ba', 'Project: Custom Forms in a Robo-Form World', 'project-custom-forms', 'There are *lots* of options when it comes to online forms.  Google "online form creation" and you get about 418 million options, including at least 8 good ones. The good ones include Google Docs-based forms, Wufoo, JotForm, Formstack and others. So why would anyone want to build a custom forms application in this day and age? Two reasons come to mind: **security** and **control**. 

**Security**: it''s not really a secret that the cloud isn''t really the best place to keep things safe and secure.

**Control**: Even the best of the robo-forms systems  have a limit to the amount you can customize a form.  Eventually you will come to a place where the off-the-shelf solution just doesn''t quite give you what you want.

So, if you are an enterprise with a lot of (fairly complicated) forms and a committment to user-data security -- still a need.

##Project Specs
* *Architecture*: custom Java-servlet framework (similar to JSP). Postgresql database. 

* *Front end*: web-based

* *Back end*: web-based

* *Security*: accessible only through enterprise SSO. Multiple levels of admin and user roles with associated permissions.

* *Libraries used*: jQuery, jQuery-ui, Dojo

* *Number of users*: 14k

* *Outputs*: Excel form reports

* *Success-o-meter*: :) Jolly Good

* *Numbers*: 500k+ forms created to date

##Phase 1
We began by creating a pure robo-form system.  All forms/questions/answers were defined in data and we created a monolithic form-to-rule-them-all architecture which gauranteed that we would only need to maintain one  template and related code.  It worked/works after a fashion.  Forms end up looking something like this:

![alt="Robo form example"](/content/images/2014/11/echan_robo_form1-1.JPG)

Functional, maintainable. Not super sexy.  We have basic validation: required fields, numbers vs not-numbers. 
<a href="#" onclick=''$("#sample-viewer").html("/samples/custom-forms/robo-form1.html");''>Have a look</a>
<div id="sample-viewer"></div>


The problems we eventually ran into with phase 1 is the problem common to all robo-form systems:  lack of ability to customize. What happens when the answer to number 5 is required or not based on the answer to number 2? What happens when questions 8, 9, 10 depend on the answer to question 7?  The best of the robo-forms systems attempt to provide this type of flexible customization: but the templates quickly become a mess.

##Phase 2
So, back to the future: as time went on we introduced more and more custom-coded forms, until these became the predominant type of form in the system.  Here is an example:
![](/content/images/2014/11/custom_form1-1.JPG)
The user chooses from a set of platforms (search engines) and the choices drive an accordion-set of sub-options.  The options for each platform are custom for that platform.  

This sort of thing can be done, potentially, in a monolithic robo-form system like Phase 1. But we eventually concluded it was better just to approach each form as a new project, and build them out based on a common library of developed routines.

##Takeaways
Forms are sexy! no.  Forms are necessary. evidently. And as long as we have to keep filling them out we might as well strive to make the experience as pleasant as possible. Custom-coded forms are labor-intensive to build, and labor-intensive to maintain; but they provide for far and away the best end-user experience.', '<p>There are <em>lots</em> of options when it comes to online forms.  Google "online form creation" and you get about 418 million options, including at least 8 good ones. The good ones include Google Docs-based forms, Wufoo, JotForm, Formstack and others. So why would anyone want to build a custom forms application in this day and age? Two reasons come to mind: <strong>security</strong> and <strong>control</strong>. </p>

<p><strong>Security</strong>: it''s not really a secret that the cloud isn''t really the best place to keep things safe and secure.</p>

<p><strong>Control</strong>: Even the best of the robo-forms systems  have a limit to the amount you can customize a form.  Eventually you will come to a place where the off-the-shelf solution just doesn''t quite give you what you want.</p>

<p>So, if you are an enterprise with a lot of (fairly complicated) forms and a committment to user-data security -- still a need.</p>

<h2 id="projectspecs">Project Specs</h2>

<ul>
<li><p><em>Architecture</em>: custom Java-servlet framework (similar to JSP). Postgresql database. </p></li>
<li><p><em>Front end</em>: web-based</p></li>
<li><p><em>Back end</em>: web-based</p></li>
<li><p><em>Security</em>: accessible only through enterprise SSO. Multiple levels of admin and user roles with associated permissions.</p></li>
<li><p><em>Libraries used</em>: jQuery, jQuery-ui, Dojo</p></li>
<li><p><em>Number of users</em>: 14k</p></li>
<li><p><em>Outputs</em>: Excel form reports</p></li>
<li><p><em>Success-o-meter</em>: :) Jolly Good</p></li>
<li><p><em>Numbers</em>: 500k+ forms created to date</p></li>
</ul>

<h2 id="phase1">Phase 1</h2>

<p>We began by creating a pure robo-form system.  All forms/questions/answers were defined in data and we created a monolithic form-to-rule-them-all architecture which gauranteed that we would only need to maintain one  template and related code.  It worked/works after a fashion.  Forms end up looking something like this:</p>

<p><img src="/content/images/2014/11/echan_robo_form1-1.JPG" alt="alt="Robo form example"" /></p>

<p>Functional, maintainable. Not super sexy.  We have basic validation: required fields, numbers vs not-numbers. <br />
<a href="#" onclick=''$("#sample-viewer").html("/samples/custom-forms/robo-form1.html");''>Have a look</a>  </p>

<div id="sample-viewer"></div>

<p>The problems we eventually ran into with phase 1 is the problem common to all robo-form systems:  lack of ability to customize. What happens when the answer to number 5 is required or not based on the answer to number 2? What happens when questions 8, 9, 10 depend on the answer to question 7?  The best of the robo-forms systems attempt to provide this type of flexible customization: but the templates quickly become a mess.</p>

<h2 id="phase2">Phase 2</h2>

<p>So, back to the future: as time went on we introduced more and more custom-coded forms, until these became the predominant type of form in the system.  Here is an example: <br />
<img src="/content/images/2014/11/custom_form1-1.JPG" alt="" />
The user chooses from a set of platforms (search engines) and the choices drive an accordion-set of sub-options.  The options for each platform are custom for that platform.  </p>

<p>This sort of thing can be done, potentially, in a monolithic robo-form system like Phase 1. But we eventually concluded it was better just to approach each form as a new project, and build them out based on a common library of developed routines.</p>

<h2 id="takeaways">Takeaways</h2>

<p>Forms are sexy! no.  Forms are necessary. evidently. And as long as we have to keep filling them out we might as well strive to make the experience as pleasant as possible. Custom-coded forms are labor-intensive to build, and labor-intensive to maintain; but they provide for far and away the best end-user experience.</p>', '/content/images/2014/11/forms1.jpg', 0, 0, 'published', 'en_US', null, null, 1, 1416364476845, 1, 1417330464340, 1, 1416369868300, 1);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (11, 'ac759af9-2e71-4ed0-a47f-fd4959b7f46d', 'Project: Dates Will Be With Us To The End', 'project-calendar-creator', 'Calendars!  Nothing is more fun that round-tripping milliseconds-since January 1 1970 javascript timestamps from a browser into a database and back out again. But it has to be done. 
##Requirements:
The client wants to build a calendar-creator application, similar to Google Calendar. The end-users are all employees of a Fortune 500 company, located world-wide.  So plenty of time-zone issues to keep things interesting.

My part of this project was to create/integrate the front-end UI and enough of the back-end to round trip data to and from a Postgresql database, allowing the calendar creators to create and edit calendars and events. The first question, of course, is what libraries are available, already built?  After a bit of digging, I found several worthy candidates, and eventually settled on FullCalendar, I nicely designed open source project: http://fullcalendar.io/.  Full Calendar had everything I was looking for:

* well-conceived UI that didn''t need a lot of tweaking
* good documentation
* community presence and momentum on StackOverflow
* drag and drop event manipulation
* and, strangely important to me: the ability to display multi-day events as a single event icon stretched over multiple calendar days.  The way a certain popular on-line calendar app * cough google * does it


What it didn''t have, and apparently still does not, is an out-of-the-box solution for creating/editing events.  Basically, it is a great front end for displaying calendared events, but any type of CRUD interface is left to the user. After reviewing the alternatives I decided this was my best bet.


##Project Specs
* *Architecture*: custom Java-servlet MVC framework (similar to JSP/Spring). Postgresql database. 

* *Front end UI*: web-based

* *Back end UI*: web-based

* *Security*: accessible only through enterprise SSO. Multiple levels of admin and user roles with associated permissions.

* *Libraries used*: 
	* jQuery 
    * jQuery-ui 
    * FullCalendar 
    * moment.js
    * [joda-time](http://www.joda.org/joda-time/)

* *Outputs*: html calendars using XML->XSLT parsing.

* *Success-o-meter*: :) Steady as she goes!

* *Numbers*: ~250 admins/creators. Unknown number of consumers worldwide. Roughly 400 calendars created to date

##Building Things

###A Note on Schema
The schema was designed to be iCalendar (not to be confused with iCal) compliant: basically the schema just tries to mirror the ICalendar spec, RFC 5445: http://en.wikipedia.org/wiki/ICalendar#Technical_specifications. And since the data was ultimately headed for XML, we opted to lean on the xCal rendering of this spec: RFC 6321: http://tools.ietf.org/html/rfc6321. 

###FullCalendar
This is what FullCalendar looks like out of the box:
<a href="http://fullcalendar.io/js/fullcalendar-2.2.2/demos/basic-views.html">
<img src="/content/images/2014/11/FullCalendar1.jpg" style="width:700px;"/></a>
A working demo can be seen here: http://fullcalendar.io/js/fullcalendar-2.2.2/demos/basic-views.html

So, pretty slick. But no event details, no event create/edit/delete.  Input/output to and from the calendar can be done a few ways: we elected to go all json; so the back-end needed to learn to read and output the FullCalendar json date format; which was just fine. The format is pretty basic: like this

	 {
      "title": "Long Event",
      "start": "2014-11-07",
      "end": "2014-11-10"
    },
    
A list of all event object fields can be found [here](http://fullcalendar.io/docs/event_data/Event_Object/). All of the fields that FullCalendar uses can fit nicely into the xCal format -- except the boolean allDay, which is oddly missing from the xCal spec.  I probably spent as much time dealing with the allDay detection as with any other part of the date record.  I first tried to ignore it, as it was not in the spec, and just do comparisons on start and end values. If (start == end + 24 hours converted to milliseconds) etc and that kind of nonsense.  As you might imagine, this becomes quickly cumbersome. In the end I made allDay a part of my object schema and dealt with it the best I could.

###Event CRUD UI:
After a couple of tries with home-rolled pop-up div solutions, I decided to use jQuery-UI''s dialog function.  Like all things jQuery -- useful stuff!  Here is the event edit dialog:

![](/content/images/2014/11/CAL_event_detail.jpg)

In addition to form-based editing, I also put routines into the  drag-and-drop callbacks to update events when they are dragged from one place to another.

#### UI Demo: 
<a class="neta-sample" href="/samples/CAL/Calendar.html">Check it out</a>: but be aware that this is a limited-functionality demo with no database behind it. 

####Recurring Events
Recurring Events, as it turns out, are a particular kind of problem in Calendars.  For one thing, they need their own sub-editing form:
![recurrence editor. look familiar?](/content/images/2014/11/CAL_event_recurring.jpg)

(My editor might have certain rough similarities to the Google Calendar recurrence editor.) For another thing, the interactions when editing, or moving, members of the recurring set have to be handled carefully, both on the front and the back ends. For example, if you edit the time on event 10 in a 15 event series, you will have to answer this sort of question:

![](/content/images/2014/11/edit_recurring_event.jpg)

And finally, a calendar that has repeating events can quickly become a calendar full of an infinite amount of events, and data.  Windowing (setting from and to limits on) the data returned to the client for any particular request for a calendar becomes crucial.

##Takeaways
Dates are tricky. But with the use of well-designed libraries, and a lot of attention to detail, they can be dealt with.

The front end code developed here may be useful to others. I have posted it on github at http://github.com/Netazoic/fc-evtmgr.  Unfortunately the code was written for FullCalendar 1.6.2, and FullCalendar shortly thereafter underwent a full version upgrade to 2.0.  The event CRUD assumes a REST interface on the back-end.', '<p>Calendars!  Nothing is more fun that round-tripping milliseconds-since January 1 1970 javascript timestamps from a browser into a database and back out again. But it has to be done.  </p>

<h2 id="requirements">Requirements:</h2>

<p>The client wants to build a calendar-creator application, similar to Google Calendar. The end-users are all employees of a Fortune 500 company, located world-wide.  So plenty of time-zone issues to keep things interesting.</p>

<p>My part of this project was to create/integrate the front-end UI and enough of the back-end to round trip data to and from a Postgresql database, allowing the calendar creators to create and edit calendars and events. The first question, of course, is what libraries are available, already built?  After a bit of digging, I found several worthy candidates, and eventually settled on FullCalendar, I nicely designed open source project: <a href="http://fullcalendar.io/">http://fullcalendar.io/</a>.  Full Calendar had everything I was looking for:</p>

<ul>
<li>well-conceived UI that didn''t need a lot of tweaking</li>
<li>good documentation</li>
<li>community presence and momentum on StackOverflow</li>
<li>drag and drop event manipulation</li>
<li>and, strangely important to me: the ability to display multi-day events as a single event icon stretched over multiple calendar days.  The way a certain popular on-line calendar app * cough google * does it</li>
</ul>

<p>What it didn''t have, and apparently still does not, is an out-of-the-box solution for creating/editing events.  Basically, it is a great front end for displaying calendared events, but any type of CRUD interface is left to the user. After reviewing the alternatives I decided this was my best bet.</p>

<h2 id="projectspecs">Project Specs</h2>

<ul>
<li><p><em>Architecture</em>: custom Java-servlet MVC framework (similar to JSP/Spring). Postgresql database. </p></li>
<li><p><em>Front end UI</em>: web-based</p></li>
<li><p><em>Back end UI</em>: web-based</p></li>
<li><p><em>Security</em>: accessible only through enterprise SSO. Multiple levels of admin and user roles with associated permissions.</p></li>
<li><p><em>Libraries used</em>: </p>

<ul><li>jQuery </li>
<li>jQuery-ui </li>
<li>FullCalendar </li>
<li>moment.js</li>
<li><a href="http://www.joda.org/joda-time/">joda-time</a></li></ul></li>
<li><p><em>Outputs</em>: html calendars using XML->XSLT parsing.</p></li>
<li><p><em>Success-o-meter</em>: :) Steady as she goes!</p></li>
<li><p><em>Numbers</em>: ~250 admins/creators. Unknown number of consumers worldwide. Roughly 400 calendars created to date</p></li>
</ul>

<h2 id="buildingthings">Building Things</h2>

<h3 id="anoteonschema">A Note on Schema</h3>

<p>The schema was designed to be iCalendar (not to be confused with iCal) compliant: basically the schema just tries to mirror the ICalendar spec, RFC 5445: <a href="http://en.wikipedia.org/wiki/ICalendar#Technical_specifications">http://en.wikipedia.org/wiki/ICalendar#Technical_specifications</a>. And since the data was ultimately headed for XML, we opted to lean on the xCal rendering of this spec: RFC 6321: <a href="http://tools.ietf.org/html/rfc6321">http://tools.ietf.org/html/rfc6321</a>. </p>

<h3 id="fullcalendar">FullCalendar</h3>

<p>This is what FullCalendar looks like out of the box: <br />
<a href="http://fullcalendar.io/js/fullcalendar-2.2.2/demos/basic-views.html"> <br />
<img src="/content/images/2014/11/FullCalendar1.jpg" style="width:700px;"/></a> <br />
A working demo can be seen here: <a href="http://fullcalendar.io/js/fullcalendar-2.2.2/demos/basic-views.html">http://fullcalendar.io/js/fullcalendar-2.2.2/demos/basic-views.html</a></p>

<p>So, pretty slick. But no event details, no event create/edit/delete.  Input/output to and from the calendar can be done a few ways: we elected to go all json; so the back-end needed to learn to read and output the FullCalendar json date format; which was just fine. The format is pretty basic: like this</p>

<pre><code> {
  "title": "Long Event",
  "start": "2014-11-07",
  "end": "2014-11-10"
},
</code></pre>

<p>A list of all event object fields can be found <a href="http://fullcalendar.io/docs/event_data/Event_Object/">here</a>. All of the fields that FullCalendar uses can fit nicely into the xCal format -- except the boolean allDay, which is oddly missing from the xCal spec.  I probably spent as much time dealing with the allDay detection as with any other part of the date record.  I first tried to ignore it, as it was not in the spec, and just do comparisons on start and end values. If (start == end + 24 hours converted to milliseconds) etc and that kind of nonsense.  As you might imagine, this becomes quickly cumbersome. In the end I made allDay a part of my object schema and dealt with it the best I could.</p>

<h3 id="eventcrudui">Event CRUD UI:</h3>

<p>After a couple of tries with home-rolled pop-up div solutions, I decided to use jQuery-UI''s dialog function.  Like all things jQuery -- useful stuff!  Here is the event edit dialog:</p>

<p><img src="/content/images/2014/11/CAL_event_detail.jpg" alt="" /></p>

<p>In addition to form-based editing, I also put routines into the  drag-and-drop callbacks to update events when they are dragged from one place to another.</p>

<h4 id="uidemo">UI Demo:</h4>

<p><a class="neta-sample" href="/samples/CAL/Calendar.html">Check it out</a>: but be aware that this is a limited-functionality demo with no database behind it. </p>

<h4 id="recurringevents">Recurring Events</h4>

<p>Recurring Events, as it turns out, are a particular kind of problem in Calendars.  For one thing, they need their own sub-editing form: <br />
<img src="/content/images/2014/11/CAL_event_recurring.jpg" alt="recurrence editor. look familiar?" /></p>

<p>(My editor might have certain rough similarities to the Google Calendar recurrence editor.) For another thing, the interactions when editing, or moving, members of the recurring set have to be handled carefully, both on the front and the back ends. For example, if you edit the time on event 10 in a 15 event series, you will have to answer this sort of question:</p>

<p><img src="/content/images/2014/11/edit_recurring_event.jpg" alt="" /></p>

<p>And finally, a calendar that has repeating events can quickly become a calendar full of an infinite amount of events, and data.  Windowing (setting from and to limits on) the data returned to the client for any particular request for a calendar becomes crucial.</p>

<h2 id="takeaways">Takeaways</h2>

<p>Dates are tricky. But with the use of well-designed libraries, and a lot of attention to detail, they can be dealt with.</p>

<p>The front end code developed here may be useful to others. I have posted it on github at <a href="http://github.com/Netazoic/fc-evtmgr">http://github.com/Netazoic/fc-evtmgr</a>.  Unfortunately the code was written for FullCalendar 1.6.2, and FullCalendar shortly thereafter underwent a full version upgrade to 2.0.  The event CRUD assumes a REST interface on the back-end.</p>', '/content/images/2014/11/calendar1-2.jpg', 0, 0, 'published', 'en_US', null, null, 1, 1416431195098, 1, 1417329828931, 1, 1416436475063, 1);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (12, 'a078692d-187e-41b0-a948-bef001716102', 'Sample: Calendar Creator', 'sample-calendar-creator', '<iframe id="if-sample" src="/samples/CAL/Calendar.html"></iframe>', '<iframe id="if-sample" src="/samples/CAL/Calendar.html"></iframe>', '/content/images/2014/11/CAL_event_detail-1.jpg', 0, 1, 'published', 'en_US', null, null, 1, 1416465471307, 1, 1416466637027, 1, 1416465614005, 1);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (14, '15f8015f-d74a-4450-8f21-46d1aa1cc0cf', 'Todos, on Ghost', 'todos-on-ghost', 'So, totally committed at this point to the idea of building Todos on top of Ghost. I don''t feel bad about this at all. After looking through the interwebs for what people are doing with Ghost over the past couple of months, it is clear that the "simple little blogging platform" is going to give way to "next cms platform".  They are even encouraging it, sort of:

See here:https://github.com/TryGhost/Ghost/wiki/%5BWIP%5D-API-Documentation

And here: https://github.com/TryGhost/Ghost/wiki/Apps-Getting-Started-for-Ghost-Devs

for instance.

Ghost is going to be a platform, so why not build a Todos extension for it.  No reason in the world.

It does mean that I am locked into a particular sort of programming environment:  node.js, ember (sort of), handlebars.  But those aren''t necessarily bad things.  I may start with a java servlet version first though . . .', '<p>So, totally committed at this point to the idea of building Todos on top of Ghost. I don''t feel bad about this at all. After looking through the interwebs for what people are doing with Ghost over the past couple of months, it is clear that the "simple little blogging platform" is going to give way to "next cms platform".  They are even encouraging it, sort of:</p>

<p>See here:<a href="https://github.com/TryGhost/Ghost/wiki/%5BWIP%5D-API-Documentation">https://github.com/TryGhost/Ghost/wiki/%5BWIP%5D-API-Documentation</a></p>

<p>And here: <a href="https://github.com/TryGhost/Ghost/wiki/Apps-Getting-Started-for-Ghost-Devs">https://github.com/TryGhost/Ghost/wiki/Apps-Getting-Started-for-Ghost-Devs</a></p>

<p>for instance.</p>

<p>Ghost is going to be a platform, so why not build a Todos extension for it.  No reason in the world.</p>

<p>It does mean that I am locked into a particular sort of programming environment:  node.js, ember (sort of), handlebars.  But those aren''t necessarily bad things.  I may start with a java servlet version first though . . .</p>', null, 0, 0, 'published', 'en_US', null, null, 1, 1416603382215, 1, 1416845530701, 1, 1416603636949, 1);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (15, '2c025b3d-53e9-47fc-8a70-a34c805a81ed', 'marketing', 'marketing', '<h2>web applications</h2>
            	<p>What do you want to build? You dream it, we''ll build it. 
            	As complex, or as simple, as it needs to be.
            	   <ul class="work">
                	<li>
                    	<a href="">
![](/content/images/2014/11/spaceshuttle.jpg)
                            <h4>as complex</h4>
							
                        </a>
                    </li>
                 	<li>
                    	<a href="">
![](/content/images/2014/11/oldshed1-1.jpg)
                        	
                            <h4>or as simple</h4>
							
                        </a>
                    </li>', '<h2>web applications</h2>  

<pre><code>            &lt;p&gt;What do you want to build? You dream it, we''ll build it. 
            As complex, or as simple, as it needs to be.
               &lt;ul class="work"&gt;
                &lt;li&gt;
                    &lt;a href=""&gt;
</code></pre>

<p><img src="/content/images/2014/11/spaceshuttle.jpg" alt="" />
                            <h4>as complex</h4></p>

<pre><code>                    &lt;/a&gt;
                &lt;/li&gt;
                 &lt;li&gt;
                    &lt;a href=""&gt;
</code></pre>

<p><img src="/content/images/2014/11/oldshed1-1.jpg" alt="" /></p>

<pre><code>                        &lt;h4&gt;or as simple&lt;/h4&gt;

                    &lt;/a&gt;
                &lt;/li&gt;
</code></pre>', null, 0, 0, 'draft', 'en_US', null, null, 1, 1416848640265, 1, 1416848644737, 1, null, null);
INSERT INTO [posts] ([id], [uuid], [title], [slug], [markdown], [html], [image], [featured], [page], [status], [language], [meta_title], [meta_description], [author_id], [created_at], [created_by], [updated_at], [updated_by], [published_at], [published_by]) VALUES (16, 'b269154f-9129-4a52-a274-31b6cf2f116c', 'Code sample', 'code-sample', 'This is some code:

    var foo=x+5;
   
This is not.

This is a quote

>How now brown cow?
-- someone

This is not.', '<p>This is some code:</p>

<pre><code>var foo=x+5;
</code></pre>

<p>This is not.</p>

<p>This is a quote</p>

<blockquote>
  <p>How now brown cow?
  -- someone</p>
</blockquote>

<p>This is not.</p>', '/content/images/2014/11/hexdump.png', 0, 0, 'published', 'en_US', null, null, 1, 1417324010307, 1, 1417328363657, 1, 1417324035250, 1);

-- Table: users
CREATE TABLE users ( 
    id               INTEGER         NOT NULL
                                     PRIMARY KEY AUTOINCREMENT,
    uuid             VARCHAR( 36 )   NOT NULL,
    name             VARCHAR( 150 )  NOT NULL,
    slug             VARCHAR( 150 )  NOT NULL,
    password         VARCHAR( 60 )   NOT NULL,
    email            VARCHAR( 254 )  NOT NULL,
    image            TEXT            NULL,
    cover            TEXT            NULL,
    bio              VARCHAR( 200 )  NULL,
    website          TEXT            NULL,
    location         TEXT            NULL,
    accessibility    TEXT            NULL,
    status           VARCHAR( 150 )  NOT NULL
                                     DEFAULT 'active',
    language         VARCHAR( 6 )    NOT NULL
                                     DEFAULT 'en_US',
    meta_title       VARCHAR( 150 )  NULL,
    meta_description VARCHAR( 200 )  NULL,
    last_login       DATETIME        NULL,
    created_at       DATETIME        NOT NULL,
    created_by       INTEGER         NOT NULL,
    updated_at       DATETIME        NULL,
    updated_by       INTEGER         NULL 
);

INSERT INTO [users] ([id], [uuid], [name], [slug], [password], [email], [image], [cover], [bio], [website], [location], [accessibility], [status], [language], [meta_title], [meta_description], [last_login], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, 'bf4012d9-52cd-4b52-8e86-3dc3a75112f0', 'John Moore', 'john-moore', '$2a$10$8FQ5YUmTeLRWyfP4A29Pq.pcRMtR9DkSAqnVikhfpgGnJLgjE6qMC', 'jmoore@netazoic.com', '//www.gravatar.com/avatar/7d075065d168a3103ea380fb1c91e35d?d=404&s=250', '/content/images/2014/10/social_networks3-1.gif', null, '', 'Berkeley CA', null, 'active', 'en_US', null, null, 1417324002680, 1412142639242, 1, 1417324002681, 1);
INSERT INTO [users] ([id], [uuid], [name], [slug], [password], [email], [image], [cover], [bio], [website], [location], [accessibility], [status], [language], [meta_title], [meta_description], [last_login], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, '8f5b224d-8828-4b63-8345-780091a76d57', 'guest', 'guest', '$2a$10$xeRyYziU.qUB4bEpyUg5n.lt8iBojP9UvAaPcnG0gRkmteXGnkj4S', 'guest@netazoic.com', null, null, null, null, null, null, 'invited', 'en_US', null, null, null, 1416500094677, 1, 1416500094677, 1);
INSERT INTO [users] ([id], [uuid], [name], [slug], [password], [email], [image], [cover], [bio], [website], [location], [accessibility], [status], [language], [meta_title], [meta_description], [last_login], [created_at], [created_by], [updated_at], [updated_by]) VALUES (3, 5050505050, 'READER', 'reader', '$2a$10$8FQ5YUmTeLRWyfP4A29Pq.pcRMtR9DkSAqnVikhfpgGnJLgjE6qMC', 'reader@netazoic.com', null, null, null, null, null, null, 'active', 'en_US', null, null, 1417331489993, 1416297600000, 1, 1417331489993, 3);

-- Table: roles
CREATE TABLE roles ( 
    id          INTEGER         NOT NULL
                                PRIMARY KEY AUTOINCREMENT,
    uuid        VARCHAR( 36 )   NOT NULL,
    name        VARCHAR( 150 )  NOT NULL,
    description VARCHAR( 200 )  NULL,
    created_at  DATETIME        NOT NULL,
    created_by  INTEGER         NOT NULL,
    updated_at  DATETIME        NULL,
    updated_by  INTEGER         NULL 
);

INSERT INTO [roles] ([id], [uuid], [name], [description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, 'c296be5e-7972-4129-9bd6-6e0288f26f0a', 'Administrator', 'Administrators', 1412142638157, 1, 1412142638157, 1);
INSERT INTO [roles] ([id], [uuid], [name], [description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, 'ace49797-39b2-4c07-8712-297dfc996c6f', 'Editor', 'Editors', 1412142638157, 1, 1412142638157, 1);
INSERT INTO [roles] ([id], [uuid], [name], [description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (3, 'f2647f50-45b2-4318-8aa8-4078eea83c1a', 'Author', 'Authors', 1412142638158, 1, 1412142638158, 1);
INSERT INTO [roles] ([id], [uuid], [name], [description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (4, '009edeab-36be-41c2-a5ec-2f6991b5571f', 'Owner', 'Blog Owner', 1412142638160, 1, 1412142638160, 1);
INSERT INTO [roles] ([id], [uuid], [name], [description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (5, 5050505050, 'READER', 'Reader Role', '11/18/2014', 1, null, null);

-- Table: roles_users
CREATE TABLE roles_users ( 
    id      INTEGER NOT NULL
                    PRIMARY KEY AUTOINCREMENT,
    role_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL 
);

INSERT INTO [roles_users] ([id], [role_id], [user_id]) VALUES (1, 4, 1);
INSERT INTO [roles_users] ([id], [role_id], [user_id]) VALUES (2, 3, 2);
INSERT INTO [roles_users] ([id], [role_id], [user_id]) VALUES (3, 5, 3);
INSERT INTO [roles_users] ([id], [role_id], [user_id]) VALUES (6, 1, 3);

-- Table: permissions
CREATE TABLE permissions ( 
    id          INTEGER         NOT NULL
                                PRIMARY KEY AUTOINCREMENT,
    uuid        VARCHAR( 36 )   NOT NULL,
    name        VARCHAR( 150 )  NOT NULL,
    object_type VARCHAR( 150 )  NOT NULL,
    action_type VARCHAR( 150 )  NOT NULL,
    object_id   INTEGER         NULL,
    created_at  DATETIME        NOT NULL,
    created_by  INTEGER         NOT NULL,
    updated_at  DATETIME        NULL,
    updated_by  INTEGER         NULL 
);

INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, '9f9212fe-16ca-4bf8-b211-b77a391caccc', 'Export database', 'db', 'exportContent', null, 1412142638259, 1, 1412142638259, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, '54523f72-fe90-4d63-a659-3c8d793b54c9', 'Import database', 'db', 'importContent', null, 1412142638268, 1, 1412142638268, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (3, '5999dce4-fd20-4c87-ac11-7a6d17ecc897', 'Delete all content', 'db', 'deleteAllContent', null, 1412142638278, 1, 1412142638278, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (4, '8a551668-9e5c-4b5e-a4af-536829bcd0c0', 'Send mail', 'mail', 'send', null, 1412142638285, 1, 1412142638285, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (5, '22b790c1-ef9b-4f41-b774-d9f7c3b71182', 'Browse notifications', 'notification', 'browse', null, 1412142638296, 1, 1412142638296, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (6, '015b57e0-92e2-4d0d-bfdb-8cc5f62e87f3', 'Add notifications', 'notification', 'add', null, 1412142638302, 1, 1412142638302, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (7, '4afc4eeb-fd3e-4570-b64e-8a282af252aa', 'Delete notifications', 'notification', 'destroy', null, 1412142638312, 1, 1412142638312, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (8, '8f7673c0-a6ae-4519-8977-22a7d2ef9105', 'Browse posts', 'post', 'browse', null, 1412142638319, 1, 1412142638319, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (9, 'f0013e4d-5aed-4b2e-8ea9-f1e00c3aae17', 'Read posts', 'post', 'read', null, 1412142638327, 1, 1412142638327, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (10, 'f0f7c8fb-02f0-4399-9071-591569f6e22d', 'Edit posts', 'post', 'edit', null, 1412142638333, 1, 1412142638333, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (11, '470f058d-f2db-4049-a8de-e767114ac215', 'Add posts', 'post', 'add', null, 1412142638352, 1, 1412142638352, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (12, '1beb8754-18c4-42eb-a028-200bd4b40a70', 'Delete posts', 'post', 'destroy', null, 1412142638357, 1, 1412142638357, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (13, '9cba40fc-3cbf-4b45-8f81-c2a847c09423', 'Browse settings', 'setting', 'browse', null, 1412142638363, 1, 1412142638363, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (14, '7b6da416-0b3c-4bb4-be4f-f1e1e2dd40db', 'Read settings', 'setting', 'read', null, 1412142638369, 1, 1412142638369, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (15, 'fb08ea9f-70ef-400d-b008-4f43703844b5', 'Edit settings', 'setting', 'edit', null, 1412142638375, 1, 1412142638375, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (16, 'e7589a16-79ee-4200-929c-f96eced38464', 'Generate slugs', 'slug', 'generate', null, 1412142638380, 1, 1412142638380, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (17, '2f52f2eb-0d04-4c3b-9e84-0c146725d676', 'Browse tags', 'tag', 'browse', null, 1412142638386, 1, 1412142638386, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (18, '2f7c227b-b13c-4a00-a7bf-a3a43f7baf68', 'Read tags', 'tag', 'read', null, 1412142638392, 1, 1412142638392, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (19, 'd3b0c0f0-503e-4468-bdc7-f9f38f291ca2', 'Edit tags', 'tag', 'edit', null, 1412142638397, 1, 1412142638397, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (20, '526319d1-cf41-4e22-aff0-695aa04f23b1', 'Add tags', 'tag', 'add', null, 1412142638403, 1, 1412142638403, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (21, 'e1b3f04a-4d8f-40c4-85a7-9dd6d20dde44', 'Delete tags', 'tag', 'destroy', null, 1412142638409, 1, 1412142638409, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (22, 'a42eef38-b4c3-496b-92e3-492873b8042d', 'Browse themes', 'theme', 'browse', null, 1412142638416, 1, 1412142638416, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (23, '20f88f00-96a3-49ad-b5ce-e036fb61e7fb', 'Edit themes', 'theme', 'edit', null, 1412142638421, 1, 1412142638421, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (24, '7800282a-89ae-483c-9be7-3cedd0a4d7bb', 'Browse users', 'user', 'browse', null, 1412142638426, 1, 1412142638426, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (25, '1718e5d8-0e38-4b5f-abac-c30f097451f9', 'Read users', 'user', 'read', null, 1412142638431, 1, 1412142638431, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (26, '5eb040a2-8046-45e5-a2a8-b3c38b5e8f55', 'Edit users', 'user', 'edit', null, 1412142638436, 1, 1412142638436, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (27, '8bf0a4ea-8837-48de-bacc-ca49d2c88666', 'Add users', 'user', 'add', null, 1412142638443, 1, 1412142638443, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (28, '4117637f-986e-4b95-aaf5-e078daf51062', 'Delete users', 'user', 'destroy', null, 1412142638448, 1, 1412142638448, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (29, 'a5e1720d-7774-46b7-a345-913c75d8dc7b', 'Assign a role', 'role', 'assign', null, 1412142638454, 1, 1412142638454, 1);
INSERT INTO [permissions] ([id], [uuid], [name], [object_type], [action_type], [object_id], [created_at], [created_by], [updated_at], [updated_by]) VALUES (30, '2468305c-7233-45b3-86be-654ed7036c7f', 'Browse roles', 'role', 'browse', null, 1412142638459, 1, 1412142638459, 1);

-- Table: permissions_users
CREATE TABLE permissions_users ( 
    id            INTEGER NOT NULL
                          PRIMARY KEY AUTOINCREMENT,
    user_id       INTEGER NOT NULL,
    permission_id INTEGER NOT NULL 
);


-- Table: permissions_roles
CREATE TABLE permissions_roles ( 
    id            INTEGER NOT NULL
                          PRIMARY KEY AUTOINCREMENT,
    role_id       INTEGER NOT NULL,
    permission_id INTEGER NOT NULL 
);

INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (1, 1, 1);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (2, 1, 2);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (3, 1, 3);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (4, 1, 4);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (5, 1, 5);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (6, 1, 6);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (7, 1, 7);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (8, 1, 8);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (9, 1, 9);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (10, 1, 10);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (11, 1, 11);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (12, 1, 12);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (13, 1, 13);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (14, 1, 14);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (15, 1, 15);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (16, 1, 16);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (17, 1, 17);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (18, 1, 18);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (19, 1, 19);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (20, 1, 20);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (21, 1, 21);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (22, 1, 22);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (23, 1, 23);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (24, 1, 24);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (25, 1, 25);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (26, 1, 26);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (27, 1, 27);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (28, 1, 28);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (29, 1, 29);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (30, 1, 30);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (31, 2, 8);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (32, 2, 9);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (33, 2, 10);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (34, 2, 11);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (35, 2, 12);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (36, 2, 13);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (37, 2, 14);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (38, 2, 16);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (39, 2, 17);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (40, 2, 18);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (41, 2, 19);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (42, 2, 20);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (43, 2, 21);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (44, 2, 24);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (45, 2, 25);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (46, 2, 26);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (47, 2, 27);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (48, 2, 28);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (49, 2, 29);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (50, 2, 30);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (51, 3, 8);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (52, 3, 9);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (53, 3, 11);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (54, 3, 13);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (55, 3, 14);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (56, 3, 16);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (57, 3, 17);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (58, 3, 18);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (59, 3, 20);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (60, 3, 24);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (61, 3, 25);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (62, 3, 30);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (63, 5, 8);
INSERT INTO [permissions_roles] ([id], [role_id], [permission_id]) VALUES (64, 5, 9);

-- Table: permissions_apps
CREATE TABLE permissions_apps ( 
    id            INTEGER NOT NULL
                          PRIMARY KEY AUTOINCREMENT,
    app_id        INTEGER NOT NULL,
    permission_id INTEGER NOT NULL 
);


-- Table: settings
CREATE TABLE settings ( 
    id         INTEGER         NOT NULL
                               PRIMARY KEY AUTOINCREMENT,
    uuid       VARCHAR( 36 )   NOT NULL,
    [key]      VARCHAR( 150 )  NOT NULL,
    value      TEXT            NULL,
    type       VARCHAR( 150 )  NOT NULL
                               DEFAULT 'core',
    created_at DATETIME        NOT NULL,
    created_by INTEGER         NOT NULL,
    updated_at DATETIME        NULL,
    updated_by INTEGER         NULL 
);

INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, '0a5054d0-da8a-47e4-b45d-1cbff645ef20', 'databaseVersion', 003, 'core', 1412142639281, 1, 1412142639281, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, 'd4219c14-d8af-4e4d-8a06-5fe304a21fbf', 'dbHash', '1802327c-ce08-49e3-ac9a-05d59d7eaff6', 'core', 1412142639294, 1, 1412142639403, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (3, '41cf6133-62f0-4486-97e4-7bbb22e15fd7', 'nextUpdateCheck', 1417410399, 'core', 1412142639294, 1, 1417323993421, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (4, 'f0035e3e-e501-4393-9bb4-309d481f7101', 'displayUpdateNotification', '0.5.0', 'core', 1412142639296, 1, 1417323993422, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (5, '0c68935a-5373-4a8c-b0bd-39d00e05b256', 'title', 'Bad Gateway', 'blog', 1412142639296, 1, 1416243625693, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (6, '2f52ac27-2eea-415f-8069-0a5250e84f3d', 'description', 'A blog about building an app', 'blog', 1412142639296, 1, 1416243625693, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (7, '30cc5423-bdf2-49ef-a0ff-be4a965f81de', 'email', 'jmoore@netazoic.com', 'blog', 1412142639296, 1, 1416243625694, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (8, 'ef4d26c0-3d07-4f89-a336-6bcc1862cbd9', 'logo', '/content/images/2014/10/Netazoic_logo.png', 'blog', 1412142639297, 1, 1416243625696, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (9, '9e34e958-6648-4d5f-8038-cd523d0dac27', 'cover', '', 'blog', 1412142639297, 1, 1416243625697, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (10, '59ea819a-ca5f-4984-9434-adfffb585400', 'defaultLang', 'en_US', 'blog', 1412142639297, 1, 1416243625698, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (11, '27541a9d-145a-4a83-baee-d1f42c312d13', 'postsPerPage', 5, 'blog', 1412142639298, 1, 1416243625698, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (12, '67723584-c759-4042-bc7c-18de74ad2931', 'forceI18n', 'true', 'blog', 1412142639298, 1, 1416243625699, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (13, '7c6d8ce4-b4fe-47ee-9d5b-b96131ccd187', 'permalinks', '/:slug/', 'blog', 1412142639299, 1, 1416243625699, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (14, '238cf737-82b6-4aac-9720-21ba65f8223f', 'activeApps', '[]', 'app', 1412142639299, 1, 1412142639299, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (15, '42d3bc8b-ee87-4edd-999b-b1cf7c5b29df', 'installedApps', '[]', 'app', 1412142639299, 1, 1417328305952, 1);
INSERT INTO [settings] ([id], [uuid], [key], [value], [type], [created_at], [created_by], [updated_at], [updated_by]) VALUES (16, '1a5f0483-ad63-436a-96d8-53f4c8faa5b3', 'activeTheme', 'netazoic-ghostly', 'theme', 1412142639299, 1, 1416243625700, 1);

-- Table: tags
CREATE TABLE tags ( 
    id               INTEGER         NOT NULL
                                     PRIMARY KEY AUTOINCREMENT,
    uuid             VARCHAR( 36 )   NOT NULL,
    name             VARCHAR( 150 )  NOT NULL,
    slug             VARCHAR( 150 )  NOT NULL,
    description      VARCHAR( 200 )  NULL,
    image            TEXT            NULL,
    hidden           BOOLEAN         NOT NULL
                                     DEFAULT '0',
    parent_id        INTEGER         NULL,
    meta_title       VARCHAR( 150 )  NULL,
    meta_description VARCHAR( 200 )  NULL,
    created_at       DATETIME        NOT NULL,
    created_by       INTEGER         NOT NULL,
    updated_at       DATETIME        NULL,
    updated_by       INTEGER         NULL 
);

INSERT INTO [tags] ([id], [uuid], [name], [slug], [description], [image], [hidden], [parent_id], [meta_title], [meta_description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, '2e7f3d1c-e522-4a20-a7d5-1398f425232a', 'Getting Started', 'getting-started', null, null, 0, null, null, null, 1412142638156, 1, 1412142638156, 1);
INSERT INTO [tags] ([id], [uuid], [name], [slug], [description], [image], [hidden], [parent_id], [meta_title], [meta_description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, '26065bc8-8dad-486f-8c64-92c4ede9814b', 'Todos', 'todos', null, null, 0, null, null, null, 1412731296159, 1, 1412731296159, 1);
INSERT INTO [tags] ([id], [uuid], [name], [slug], [description], [image], [hidden], [parent_id], [meta_title], [meta_description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (3, '827f92b1-4128-4efb-93e0-1ffaf26feadb', ' About', 'about', null, null, 0, null, null, null, 1412731296159, 1, 1412731296159, 1);
INSERT INTO [tags] ([id], [uuid], [name], [slug], [description], [image], [hidden], [parent_id], [meta_title], [meta_description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (4, '2a8dfd34-c55d-4a03-b6d7-938b28e83836', 'blog', 'blog', null, null, 0, null, null, null, 1412870429861, 1, 1412870429861, 1);
INSERT INTO [tags] ([id], [uuid], [name], [slug], [description], [image], [hidden], [parent_id], [meta_title], [meta_description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (5, '26e35377-172d-45a9-982e-956a76cbb5da', 'other', 'other', null, null, 0, null, null, null, 1412886485132, 1, 1412886485132, 1);
INSERT INTO [tags] ([id], [uuid], [name], [slug], [description], [image], [hidden], [parent_id], [meta_title], [meta_description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (6, 'dc3cedb2-b5fb-4423-9da9-d5ea4a78442d', 'project', 'project', null, null, 0, null, null, null, 1412887883081, 1, 1412887883081, 1);
INSERT INTO [tags] ([id], [uuid], [name], [slug], [description], [image], [hidden], [parent_id], [meta_title], [meta_description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (7, '937b7562-569d-49d8-ad8c-6354512d6a63', 'nav', 'nav', null, null, 0, null, null, null, 1416428838504, 1, 1416428838504, 1);
INSERT INTO [tags] ([id], [uuid], [name], [slug], [description], [image], [hidden], [parent_id], [meta_title], [meta_description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (8, '30b54ce0-fe2d-4c68-b411-c85ceaf71a56', 'code-sample', 'code-sample', null, null, 0, null, null, null, 1416466060872, 1, 1416466060872, 1);
INSERT INTO [tags] ([id], [uuid], [name], [slug], [description], [image], [hidden], [parent_id], [meta_title], [meta_description], [created_at], [created_by], [updated_at], [updated_by]) VALUES (9, '892a842c-1592-4b1f-9f9a-e07106c13b13', 'projects', 'projects', null, null, 0, null, null, null, 1416601119666, 1, 1416601119666, 1);

-- Table: posts_tags
CREATE TABLE posts_tags ( 
    id      INTEGER NOT NULL
                    PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER NOT NULL,
    tag_id  INTEGER NOT NULL,
    FOREIGN KEY ( post_id ) REFERENCES posts ( id ),
    FOREIGN KEY ( tag_id ) REFERENCES tags ( id ) 
);

INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (26, 5, 6);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (71, 8, 7);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (72, 2, 2);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (73, 2, 3);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (74, 2, 7);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (77, 12, 8);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (90, 4, 5);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (91, 14, 2);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (92, 3, 2);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (93, 3, 4);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (94, 1, 1);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (95, 1, 2);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (96, 6, 7);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (97, 11, 9);
INSERT INTO [posts_tags] ([id], [post_id], [tag_id]) VALUES (98, 10, 9);

-- Table: apps
CREATE TABLE apps ( 
    id         INTEGER         NOT NULL
                               PRIMARY KEY AUTOINCREMENT,
    uuid       VARCHAR( 36 )   NOT NULL,
    name       VARCHAR( 150 )  NOT NULL,
    slug       VARCHAR( 150 )  NOT NULL,
    version    VARCHAR( 150 )  NOT NULL,
    status     VARCHAR( 150 )  NOT NULL
                               DEFAULT 'inactive',
    created_at DATETIME        NOT NULL,
    created_by INTEGER         NOT NULL,
    updated_at DATETIME        NULL,
    updated_by INTEGER         NULL 
);


-- Table: app_settings
CREATE TABLE app_settings ( 
    id         INTEGER         NOT NULL
                               PRIMARY KEY AUTOINCREMENT,
    uuid       VARCHAR( 36 )   NOT NULL,
    [key]      VARCHAR( 150 )  NOT NULL,
    value      TEXT            NULL,
    app_id     INTEGER         NOT NULL,
    created_at DATETIME        NOT NULL,
    created_by INTEGER         NOT NULL,
    updated_at DATETIME        NULL,
    updated_by INTEGER         NULL,
    FOREIGN KEY ( app_id ) REFERENCES apps ( id ) 
);


-- Table: app_fields
CREATE TABLE app_fields ( 
    id             INTEGER         NOT NULL
                                   PRIMARY KEY AUTOINCREMENT,
    uuid           VARCHAR( 36 )   NOT NULL,
    [key]          VARCHAR( 150 )  NOT NULL,
    value          TEXT            NULL,
    type           VARCHAR( 150 )  NOT NULL
                                   DEFAULT 'html',
    app_id         INTEGER         NOT NULL,
    relatable_id   INTEGER         NOT NULL,
    relatable_type VARCHAR( 150 )  NOT NULL
                                   DEFAULT 'posts',
    active         BOOLEAN         NOT NULL
                                   DEFAULT '1',
    created_at     DATETIME        NOT NULL,
    created_by     INTEGER         NOT NULL,
    updated_at     DATETIME        NULL,
    updated_by     INTEGER         NULL,
    FOREIGN KEY ( app_id ) REFERENCES apps ( id ) 
);


-- Table: clients
CREATE TABLE clients ( 
    id         INTEGER         NOT NULL
                               PRIMARY KEY AUTOINCREMENT,
    uuid       VARCHAR( 36 )   NOT NULL,
    name       VARCHAR( 150 )  NOT NULL,
    slug       VARCHAR( 150 )  NOT NULL,
    secret     VARCHAR( 150 )  NOT NULL,
    created_at DATETIME        NOT NULL,
    created_by INTEGER         NOT NULL,
    updated_at DATETIME        NULL,
    updated_by INTEGER         NULL 
);

INSERT INTO [clients] ([id], [uuid], [name], [slug], [secret], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, 'c8f96dc4-e2f6-4500-b6bc-1b45bedcca07', 'Ghost Admin', 'ghost-admin', 'not_available', 1412142638160, 1, 1412142638160, 1);

-- Table: accesstokens
CREATE TABLE accesstokens ( 
    id        INTEGER         NOT NULL
                              PRIMARY KEY AUTOINCREMENT,
    token     VARCHAR( 255 )  NOT NULL,
    user_id   INTEGER         NOT NULL,
    client_id INTEGER         NOT NULL,
    expires   BIGINT          NOT NULL,
    FOREIGN KEY ( user_id ) REFERENCES users ( id ),
    FOREIGN KEY ( client_id ) REFERENCES clients ( id ) 
);

INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (688, 'gE8r7sIVn3g7Yr6uAshhgpLMI2FoJ4SD4g0OS3XZQ6K50J2PS9zjHMP98gIkzrW3oslOkcrgHUGJqsGR3fS7O23uTwQ9PlF6orr4HBCf3Afe9HXlKTg37Nah3qyJ1U7jzRvumwx5rHyg11TTSYNE8kVsBvwJnqs1UY9QDd2yUn69KLnN7LPjj2RFBha3JzKfIyKR3LtZGyL9G3ceHmQsTaqBN9efnAhMXuvlYa0OPSukutJWBpW9CnYIm7yBWlN', 3, 1, 1417331937947);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (689, 'fYIYYhOezbNd9iaZh2qWb5GDirHfeN5EXzSjQ0nuIkrUhqt5NhfND6ldURp46lkDsKICA2LyUFwMbuG5A22CcFEWpABc4GAIhS04cKBCyMLvOd1FD4lMgeTkgfeChPt5oWmQEokc5QJ3dUKBcN27XGfhRzpYPQhgrrG5zd763UqWtaPJYJAGFrTfhLrqz9fB3XibEKlP5txTpwSIJxMROZoUgUdHM3cfsknpCchRDPiuKcY6yqyg4mPtb7x330j', 3, 1, 1417331941316);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (690, '2kU5oi0xDkEZPe3K1hOEBtejc6iELQvqsuumEk24s58l6VdGP820bfPNk2Im45KjMdX054gWjTwrGcOhtTxw53Qq0MMH5InJO6JYLms1Yr0ZdaRLQQo7opr4oAKMudvhXrbjrwPeY2EDG2iziyLmjyOsTn79YKkhS3Qpva8OwJaSLKKrIyXE9bX7IcEhLIdJVRD3XNXwetJUsNgEMIsa7K2bjkCpjyk6vROnlWngjGpk2j2eIAvQhDX65M8M0Zp', 1, 1, 1417331952058);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (691, 'NXcavtD2bT9wr4bVhOTmZi79O8wy4e7J6b3R8sisaCynpldxhd771MK2A99v2w5d2Zt7gT9nZJsVHrNbUPp8DbZbZZYDE0DncZyib47CsMDWRtidNUIv8UGspe2cCd0PcYBoCIDhlvOxqF0zKhcRR0VqIP97z8KCT345p9igcJBWyqV7FVmj4XefYDZ7fkaz5Ho6RYJXlNLAKuL3OppHS0TwlICNyIbWVVQ5HsU1cTXbB72PaLQUXp1oaDuqmMa', 3, 1, 1417331970595);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (692, 'qYivEP5MOKT0dYY4Dhu1ZNzwMIYvPJk33hRlk64HWUJTXdU3rpPOuPj8QRPfAXmAZzOLShZx2GT2LN7F5wxmyT3LJL5YHwwa34qhBtPPApJtGEq6UpfOjVexwAl2PbRvppcvEJoONxku5POuzkf183t4bUq6cSJuQgcdu6P64LasKgSYL6LbSGneFm3XPYhfwKjS7U1NUrr09NpDXGO77LKPvgTfJ1Q0jAcHrz3o8jx7NnKXiBh4tTe4Non9q68', 3, 1, 1417332062210);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (693, 'DcXOXJisqS93NYETKQP67sZBSVmbUnFGdmNHJU8L9Ixd5tn3ebb2DNtcNT2RHKQKBvx538AOvCevvMKbX6uJxywFLVHR7axdp2Fvmt8mxn7ITg9jiNTusMPevHp6hXO9r2nfPomgPcJI0MUU7yhURCRO3ki7AD7ZTbN5KsF0z2b21oJN4nORqdr6zzy3z9ZDHz4re85YqFaLHHlhxwvojWxm9O9oMt3tPAGkuiLsvBAEFt6yETEAclOExU1n9Iu', 3, 1, 1417332100508);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (694, 'vAYoUO7Vg61TVyCiDtjUJ3O2X979pLzumi6Ii78fR1yMdvLqpHzXuH0U1zvmIQ1UUUkzsYo9mAeieFqLza61ct1POMQ6hwN2gYHDxsQ19Bdyn1GhCWKCZkyVkOQ5G5msPzCRfh0qC30mtdts1WPxosLRaouAG5fYcyGzElF3FEq1Rs8oBzGM20CR7mI7KAqdSOqMXpMzX41HilcsqmM7asSxfIQCd4pEt989uknOFFTO3Ld1zCmYR2S42zrY4aR', 3, 1, 1417332104824);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (695, 'rt8gUNVxUeYo9m8hLheFNHuGjXZHV4FiLYbbE3tTpsqWAXLx0rS4ZPDi8DE9NgE91qYi3bnYRe2G0MtLLGKPHjW02wfpaRTBkXm5542NbtKGhPUJRcRnQuOYvA7oksiBmo8Fk6OlbhZ7wSJZKKSjcRTg2nrhngbSC4sgnc8XUkYPpPofiNNHYaJmw3YdbdxLCuU1kUVeLPtfeWHw3G7jGEhdihbl3LUdNpaIFlkSuNrPwtxl1DG7TdQsXKNo9FS', 3, 1, 1417332645274);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (696, '9nmCXgH55nIyMW9h1o3mHQy6dLLToJeXas1ZVZn7mWihlsJgUprRrqo8ulNJlg5cKpXpRSXOJDJWAJZX4T9xBCqFZi1cBkZfudD6TOALeldprDw0aFVTI4WhaedapJfZCSzdOwInP6XjDS606FCyQI7wvdiFkgQhONlDJdZ2tD4xJC693C0gqZQwtQXQhXR9K9j6KHlpe4sAzgDRAXhbIgpEzxcxIZ3e6bPxmUuweDLXn78IQtRzDsNAHaC0PiO', 3, 1, 1417332731102);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (697, 'GhQEsl0I4aiW3MXkDO498CxNfxFmMggIkPHRVxk24UJ5delOTMY4X5ZOn7VGUdnslqi5s4fV9r2OExeYMYj0VeN6tRuX34OoqkgKp0TMRujMnp92nEh18B3UmsMg4DJY5YO8iTW45muQUseTBqifooBRp01ddlNad4kh5XUvLqRIUpxGPvfzCi4z3bJPKQN9f7ImRfbgZwfwDsq5ZSoQliVFrOlaWpnvovCHbgHyS6y65Mq7FFtu9uTlz3jkmV2', 3, 1, 1417332788100);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (698, 'p2ne5NFjoB89ZRZlbq7LnYeSAT4hIhPhltynia2gdoD1kpvFMn4NBcwTfZS8brZepz4Z924OrI39kKhcQxBosPrgdNE3UKTMn1ojmCk09C9BOdss8RTyIEGZNRUqSi5tTVSP9HHdMbGVTecaRxJqsxjjkXS5XY7Gcs5wOMoKvMV0Vm7b16mvoUID80yK8CLkaCJqFuVfWQyNazoZ0W30lHspoEVXhwRrgD8UNzG4b3Yw5BPJ6axHU2GMz59LsXJ', 3, 1, 1417332792672);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (699, 'ndi663cDEzOA2uAcwHZFD9ik31b3xL6eNplpKNSawvXOAMniwhjPmW2IKY1WzH1khE38xLQYqzDU8ceGkI34l6Yyao41YC1nvmjNBPiwWY7EwwVGr9GZazd8AMv4UwkDObgvDJuKjW1AbyRwQa7wBmt78KPyQUhTNEAlrF5h1hQOEdbZ2W5HglFwSTVd5RT2w9U3OgZdzefSLfVBdST35LvbFHCTwxRVJ0bLMAp3BfYQFksnV8mcTKef93MJU9k', 3, 1, 1417332812630);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (700, 'eurKCcluqXAwYuCO8PqFY8DHezIN3UqAvBufYQfG96K8a3huDoiqWg6slrLYJ3fpbq2jGSzvTjkXJXW2ndwrLaUlBU92NQro5jw9vETjsP2TrALzT7gJNrrs8SQAcuNUvr3aR88Anuaz1Y2tq5fHAmHQir497cpxFBijEnJCy1gCwgOGFvapOROygp97PzMb7NoSTlMcOtK6i0Q8Y8tzL9C0drg6eaVOoutpHfy7jpW1n0SSiOAm6bBhX2urhIx', 3, 1, 1417332815586);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (701, 'fARsPU3U54euiucPDSNNcpE1GlJ0gUPXlonvNWVOwViUQ4ifuSn2DoOKJb9jSk836JaqqCQYI7pIoQEAWCI4YaWnXutA17WwqGbgmyDWzJCCNwGeBijfcd1c1bNkUirlbn63TwNkWBZtFAKQAntpCBUf0cQCpF2nVAtlOwco9pAZFL7pZtrZNPJ604KC702MfK8rg7PTrfFM6gNYAPAr8nZKbXGrf5050wkHZaGvMdkZNEL7w87k1lTfaJXbkGW', 3, 1, 1417332843318);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (702, 'LRC0rz2yJb9NqfdQ9u2vix6Px4WFM2LUvWMxGDhSFTCmEcx5XfvYHqnFLPvnsWQUvsWxIUTxVq9jSfgujz948KPtqB1AsEA6WC3hi1B1R6VWEDPEXOZvQ31zfqj3J4F1MmC8101S7BhWMIE9DHASyYxz9pm5sKuXrz8GxvqVGcf9cjFQPAbq0Igyq4j4RzoJUshzQbUTNSunm7u6Xruw9UqHo88aJ1uW7bpBeXKcmToxooaUu6peTPXiikoFPmv', 3, 1, 1417332846081);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (703, 'Q0iOiDOHZoCzi2d19bA5qacCB2sfcFkmtoOpPTijGGlivrglvB4h78OOiqPOhMmWsZfFYxPRgnrZnWV3iQWQOFsPBNzTnzD7SsSZDlVt3pyPMZOUGL051Xuvx2ePCv2WSRswgkDcj6lJgO1m4QPTK01ZWtB6SfyBAWMOOgf8b9GAaHweI1nsCXNt8nJ5gsuJxEsuJEyfOJSFQTQLhb1j2MgpVkGKdeDGpHwTnSOrRAO9hF3qNXUBCiymWqTXOKb', 3, 1, 1417332933540);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (704, '87YUcJWM9N6UzTcX304XzUlbNNnRJQP0aqMVyhx8yMKywidU7j5K6NY8XHhRwv0DNBiS6xnBxkcbcnnAz5we2YhLr26H53GKw6RgVl1t5FJMjgHI6DaZB1EjIOUSjjxy58Si86QHOplaKngmuDQEipgH1qjBFgSa7LYo57ypwg4mcP4j1gjWVPgCBoMVZwR5e5T01gE6mXVhSxFU0DgetImsL1WsneoHqaeqP7wFc75Yk5LilcKpSdzStyFkoGg', 3, 1, 1417332987394);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (705, 'dgHnrY6jByA1MxZLXc9KlMAg1I3BvLp9nUCPlLOrHeE2akq7fCGZxyX9ricvfT6SnljfGgyrhd4hiYT6UXyiYvfz9a93tlm6Bvev4IPiURY8PKRupxZEMXLHLGbry5M4ruqrlthI4GMGhKRY5rgONtny7ggcRssCIQQN5jQKxksklMBM7ErXPkGQxkocUAUazcCdb2JRI6Qj9BWrLwRAvvVZTuz2tLZ6wD9BcaT5XCTv16HoByuNwmTN9aLxeOW', 3, 1, 1417333000821);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (706, 'eTuUnQ6JJXVkad6JBNvYbYnvEeJjqMtZ7dRCo5k65Y265jmeUUewraKasEMWCzRmurpNeG289N8A6TzktXcURjJQrj5yqij6RRmxYNe01BdgcWBzQvMdCjCv4wHS93uQvr6UFlHEHYgWQHebd22rohwZ6iTUgg4wMsRIZ2HVf5zbalNKOdxhBDg5HzRQUYI6PV6Yr9kXdDRRtoTvcNZrpI4j5Ew5l1i30qstsTqVWVVSkS6sNigrDdaqpdfupI8', 3, 1, 1417333004856);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (707, 'jUl8LX2kLKmpjKa32cWzErXIrx3h6YMOVuB3UgDsaq4BndeEtW0PdEgDD7PLnfLgBPHUrrtmqW3mfwylysME06Ia4rEYhp8NObxWcKeHfWKs2lKsOxijSQXptGIuJ4fdrtcNL1rqMu69chO10e6ONAUC8LjBwLEz5cMS7ijSZtd6di5xcbz3lNDDKYWQ5IddD6aWE95nKpXjFHVrSbgjJt8mEBiZOeLqZLDgbGdO5eelMTpmfpYm44wxyX9hbOo', 3, 1, 1417333007313);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (708, '6cm0FdLSosmF205G1jjnAdQF8KPFowd02y37km81K0R8TXjIZqTXJ0s0Gf6a2Z7E9mXWBEun3aNGNgsDbbWIeFRXPeaqSFdqwA1riveVJDNuFk3TMlKyNYLLSLCkWtldlfY8i7muxlHqEZEkJLlnbQZrsxvP3mgAjEtuq8AXUptSdsVCbl3LAJUpJYEGVHgC15EwKJt0OyFc71o4lS67mKc48S1ymvt8RNWwmeZcsjJoX7mrdbdyCeSbtRDt3Zj', 3, 1, 1417333014456);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (709, 'jgsbgQk4aPLN0P7bP2ol2OIYwU9Agien6igxCA5HQN8c66loQPsh2Op7EjK4PYGARl6Vq6zTewQqs6ro5I1ey3xem0t18AtUpQj3iaBJIaqRHnf6munEEeHP5SSuMpyCmdh5RJ1ZfAC222YeSRk5X6ZBVfVWEE049Fc1yVdPdnI4GaGkLp8GBH7jTgwUas00cmMoKwZO5KcNWHXv6UlDR32u4g5WD4izO91b0L8DUrBmA6fVwZzr8uxLH9EBvE0', 3, 1, 1417333030434);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (710, 'XcW80sJbbSG0P6lb6vC76LHkmarNMg8QZW1y5G7MuP0oatRKkmTZaQF5afbums3twfc9Z2qTOJUOQDqXrBLrbIrRwYDlxMoRr7EyhpZW4ibQPpwAaeVO6uO8lZehYIWUmbdJc8mN7uN39WfMlZZL8B57QDYyI0fMx7hdy9u3UD3Fa1g9NC5Nl9MDau6NlZnRMP000Bux45OfHuM1Pt9Lt4UKB0Coe3PauHGaQTEpgDPwEbQc75d8TOS7PoJUZLt', 3, 1, 1417333033722);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (711, 'WCOcUSDAUnod5TAEd5ZCTDZZ3fvG4hGjz9Vg8knsujAc3DAZwkD2nJrxRCYc2fap6wZCKZpq8maTzjHp0S3S9ZwPdigPE1oeTky8u9QlJR43WkjWCDH9n7GBThD5uLyYyololGYCRNz6rxdWA1eQCUidZcMUJe0ObVA5nY7gxbxrNPAWb31iDdFgAEZEHyr3SMKCA23jX5nCMttXfSrCk9ULYBSzCk87stKdSPQcLKoiEb4dxMtUjn9hWbA3w7f', 3, 1, 1417333039275);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (712, 'YZv0bnjr0KUcGcnxW2Rim3FcWOxGrUD3nq5vUxMOLBl4wk533ECI2NecYHBCcYt1eFvz9NPC0oEt6hwWfLu0tmfkKQMnMQfkOIjZasKHCl6o9mtBUoaUaqDMw1I2mMcacGrGaepT05JRsxsd7horKqunfoNpktTWHPxn6HxjuoeTpzobxz5CUE0zgjMAucxNDubcidV8imXJSigkcqIgsdaEfMIh51UfIqm6B4nZSmmmjKgM3YoYm4TeIDZ9DmK', 3, 1, 1417333042423);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (713, 'OzyeXMBKhHRKgBWMD32wWcqnY5JscoIsThKOPy8XRrWB9dSbO826WTtF347fJit2dsuHhBKHLYaPd92NoME7bFzCPTV4t4R5HpES8jJs5lRZtk5gquqNi88rQkUQEsO1piRgpwuIftKM0ZTmiT0QI4pQlJEGJ1swEWfd2m5n2xg7pBbcBWPsJZhbTVmOdvYaMLj0paV5QPRPlL3gkVFWCyuyxCjW28bI8NdJD9fkouUmJhD5ryT24M8RgDFysWC', 3, 1, 1417333117145);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (714, 'TQqcyDJGKeHHa3ln3mKD7MwIcF1V8NebxWK6ZM60ez1PfDrsFCIvYRL9CZGaXYW2WHRTPHUh44frDBA9pjhcdg6UQXOFxOx8WtXmATE9iTPKT7xcmJPXg1uOXaltSlDUKgf38pBDO4mj56zDbwpzJ3yeVfzIVckRYG15th98bZmQzO2LLtjuNnio1JyjfQrnJaBVe6qeDBjJbnb90VScA5ziOFMMCOGPM3n2zNynTbrmDlXDEs8e9u49yMtakGz', 3, 1, 1417333200820);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (715, 'MYOXdgdHO00QhUIFFwXwUlAQRpgmZRe7Fonuv3v4mECfvfasrp6iHNPppG17Y5s0QReiUr86a2la4RL0gZJxpDqUOblaNjVgFr0oKVOAoqw2fxfrSDZPprjT58yVY1igfan13Zb6UoL1iB5mewNF6zUMpQjmRFxqsIoazigFrd1guWtOxGLyXOi3R27JONnf7c740M1OFFIGGkG7kLPdD0JjdwUXP3EMWFZL9fKIUVq24v3GJDn7zBAkp597ydz', 3, 1, 1417333225036);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (716, 'uET459GI293IJX29ygVqjNIKO61dGhAcAS3sK3gfQi4qtxEwfVPn499H5BEGJ8kYpV86Y9fblamz8pvpkf5ifxMNeCm5yeerYxtQHj9N27IEZkYsLfW5gKF7rcK9kQ5yvGtUlo3sPk1j5YxAbJYIQqaCy63io66s9kYqvy9H0fDE4MgCAu7XxSzTX1rkP7iZc4p6GTRGPWWAHXWKGwH6PxiH7nAYQNhjs80gVU41KdKLILNKP4BZtYSENe6DI58', 3, 1, 1417333280272);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (717, 'Gej6USy5XI0CtsAhGn0NLCjQDvPJqMcVs0p3hcZsVdIKHyJAlXQUofihp5hbJ0WxebcUcIxSSl2MyhBddHyeHGeYmo2QPTgo37GXJu7ZfZGKWBqcgay2A1PCAFgylLA6XkdYwnLsWcKZOEs6DejpSg9yPhKfi5gQ8TjbYMWFRqGURgFdwxQRcPnUQerMeXvNwszt4tS3XRMb6dsQDVQdfi0sMU6PhoJREkzLrRi75zJ3u9Q4A3JEVhRWmn44c6F', 3, 1, 1417333289529);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (718, '2D5mhokj1ThoMPLKyuZUUtx4cDvu3aH42ef65P6SVt5KzPPh0yqiioqoXyyLoHR1fReiuOqdibU9WHXy0YRWnROBnWCrK9LwBHgGuwY28RlhQgNUo8H1CKWa40Ujp6Z8zYBQSrJyPjhRPcnSjoVNy7BaBbj3gRF9d84GQ5Wh4Qigi3fGcD2LgfhffzP0sygPIf1j5f59LPWuKEHAhmX79uCFbhgGqO3FLA0koK4nbtsZ15L9lov6lSUjJKj0F7L', 3, 1, 1417333293980);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (719, 'A71vMfAo4K7nmOwCLsQ0wo62tyAkO7LWW5wYJdf1qCtBi8GmD4GWF4VuKQpMyPUyN59Xmwg9pLMoInPTsYVQvHRftd1K4M7E1la7KY0CJW5R11eb7ESBS62zcYNyy4Bqik1KH55WovQhhWfUrwPp9cnYetxJhND7UshvqpHAn2Xi7Hoa1GKh80OO1girb9YJ42H3tJh9CGpd77noP8g3WmYqX6Uq861MxhnM6YwblGQn4GpfK79Wuv0JaihghIM', 3, 1, 1417333363133);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (720, 'LC6fFIxEHYCZIuayt9dkTdEd0JMfkjAWjWepWQlSpNIqjN5MVbQHivmsBbxCGOjrIr29CxuL3zMEftpxsAygBoRLhysrTj4D2tBwDMNH4VIW2HdVuvrvGysFne8zkOFbDcDI49ZjOxjy9hyI0tN7Vt002GvvSQpJyxO9utXb1FPU8o7cC9Nx56779PM1g8DLzswl6hQp1HyXttXJWmsTLFhdGoI2zO2kKiIMAxrctMDTRF803KzbLtY1PiXePNS', 3, 1, 1417333366550);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (721, 'XMS17uDUWlAyj2ItQTNsSvLRyfLoKgUSyRZce2xctztafJlF7K2YrUno4HHsNZqo8YvsbOs3ezFTHNuY3Dc4xMWO0W0tiAmVhcm0QG1IvKAmPCJj8WLQzkWCeNFynbsEpboE8BGh2Ynh0CbidqJcrquULikJpwx5R6iEEv475T0W3cKQT3vWdcctd3SKD2LgxDsMb5p2Wbs9Jc2RC7851wNpx9ZLJiQv6p7ouRswVBWhF6MMr8RvHkkhCGsCy7I', 3, 1, 1417333370688);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (722, 'N9Cni8B0442vy9ATQI2mTM6j71MkW2B8bpTCDmVTCwAEcW56Vp6JHqtTui3xV3LMP11VFbNdcIEdk57B2prqZcZ2VXZCVzYTAnkdeCJg3q2ConVZkW2tD1KFQqncTjoJh5UyFSN6g6wkacUrQP29hofs1TfDnWVrjmajEklAJDOIfEP0OgS4XHgY7bo9uTJ2mhVqONFwFbPQQWSLRK8j3hXIcLmuHa9qwDqE60fbp6zIcuI8k1t2lQ2TK2LFNgo', 3, 1, 1417333374383);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (723, 'vU40o1snXnhzf54mPNoS8uGOS2t8puLeutcdchkujuKTE7HMa4IXcwj3FlZ5DRngGzLgqzNzmh0miCBDYNQX65HpieBcnhlJuN1FxWrAfgMh7OpDEaDqiLCICKlJcocFZOrtLGtT9lRKAVTeWQYEANz0LYv53ThjRzJJprQgPhwr3yNBdY2EkpQCF6xjlmANYVRfPKKFlwxzKKQn8O7wr28J2IW0nxRSuEKgrrsh8yRESUF6n7qEWZvv5YgWEfi', 3, 1, 1417333389810);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (724, 'wlF9brXogLLq6m2RrMnsBgoQaDz9tqnpkzrHdH29kULyk0eWnwQ6v2YeZAgjykEz01UgkSuQUPECYGyUYh4dalB5IA1m8fpcXvA9mSxZ0F98IfN6WMNFdXAOMXOO6UorJFViV8Y0kOpH4AylNbaG6zacGlAIeHZtj48HpeSq287x7Mi3lOgXFQBeLHyNrhrtlZaPdlCnCT8i6x4YaM3TcyB8f9u431KDVhqO6HHl6PlrM3Li8aMVPGmYp8Ai1BU', 3, 1, 1417333393019);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (725, 'Qrfi1g6zCFxZfozlEN1iG8AltrqnTOLldN08LIa40vfxeEw9SqTWWyQr8GnupG4Cxbouw1NptMu6gUzp9CFhNQoeey1SWFK58YiWPvsOt2AvMP0tWNy9fIzSJbSxZ1cQY8pSZHkemCuu7RgWq9ZcrBXraQZFNfWQ4rQKmIVq1WsyotBMsbdCTlW7igCasVQ8Y0IL0HzVAVKIy2dDVgXm1Y2xVXN28jAgEPuBqLt8Sy7OIGaz3LZq2wkWFZ2ntrk', 3, 1, 1417333397599);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (726, 'iMMpNiOrGLMsjfXOUd3byLIeTnsumK2sWjgea9qumWW1QnfhfdIA5fJOUzHhMbuPl4JOZQMLllDg8OlbckzRic4WXsVSloEs6TUwlyPIH5BkR1uxABeNDWd5QmylSK7CKCc07PvhWpW1GrgzBjcn9SVI85KRDDwg98iv5WRepik7wkEbsJBWgdhKQbCVCuy9e66v9X2UnLJL37WeSkV0ctt5BSTHAti8vRnxP45odG8dlzjWbV3U6gwZxmyYD7y', 3, 1, 1417333399426);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (727, 'JyXoK6PNqsaAhVPwwRYrhcuUmDC54R86ONKyY1lmgBReoVlTxZXzpi0s6SLrxrDNDjSWMXLM7LalfSQGDcXKlYwBvh32maUIETsMvz4PzcY3M76JqdyLfY1lK9ekt2OZdSOV9jE8VcqPKl7PIUMJwLtkTmZZTi95L7J8z2dX9SUm4rYY55dyCCdbe6ZYckcoBDg7ndtYV2pf2rQlfLIhb8MlVzfIOJfe56DXUhiiUFNUWqD7FRCzNRVcqw5pVhf', 3, 1, 1417333434251);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (728, 'UfvPhF3kQwc9NgAX47HEPNMrFUH7ylcDDfTQaOmyiVEigZkwJUQ2AqL4bL8VPDRx10Ryic1fZRdjy3GxVQg0K3wgqZyafKUTJKRrXjYnEwxY1WmMenvqMT2XlLJOcU01PRzCebQZoVJHdaxIBu5vg1iiI2GWCwZqMcUdD2w4Wfa4A7AwYlq8iNIhCPLym7N8o2d63w1tnVQ4xYSzAjNhm3fy6tAOtmpv3mO3c1rVMqbvR5g4itbtp9nVI5xl1Fd', 3, 1, 1417333436981);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (729, 'xUv8L5UBI0EPO7pbkmmGTKW5VnzhXVkCvwpfslLsfmp1UEoanxwWbFDB9oC8V7uB7MB2ZjhgW3kL5QkA6gkB7iSWQ8SZXNoYf2m6e4lCA2ZQb8YjV3Xx54R8YHhD4i6E6206y4FUBROt0CBeigAc4PKltahgP4xr8bHauDyzf9rYTPhB0dbfRGQofWirYKye84pu4D5p59mlBnja4hoKkWW7AecHyCTtyETh1qIrZfF5ejdV2AQfYldWKABxwj3', 3, 1, 1417333499873);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (730, 'dDVDS5M3GQQQ2ym8kcOzQQ8Zd394yBu6g7ite4CLQLWNnXR3x0lKWomKWIjf8q5Pfy4Vbs4hivUVEhwKePCYZoumcGsNMzH5bvjFy5FF9Ulw1Y4LCl8dzOLBLPink5qgqIDCqgDfisQRZ67sRavnBsWSt32IVaPXHj0XwPrXOkECNvngGq8zDQ0n2Tt3bzBlhCybFHG90poOkXYJQ8XoMBan9CDnfbT3FPRS3SHX65vnMla6bwGCZkrVyyVGUw2', 3, 1, 1417334033056);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (731, 'xq1h0FpnQKJsCInx6Ec6JkuIHIRHsPYA2OgenPrCEMsVayp1jrD3NPqgFlhKf4skxrQbwtRmQxePEVfRLsElHy2gMllOQuUcZ8uyzBNKPba05hCK9lOFwRpUfjtoi6iKU8slU3gEn2cozoSUvf3wCt4qmz9SIkjLtBHENKhkFdBQd1loAxMlAwNOMQGKakPWuEqsM1CI7afU1dbujZdnmu2vBXBOWM6PiwzuCymuMGT1kZSDUq6ZemuUzFoYfTa', 3, 1, 1417334034749);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (732, 'eufthRg5wDhIfAwklM8vRZrdkUoACrrJGp6LF85OgWdYYG7RjB13MZh0oufcJKASKDTIXNMz3vs8AYTErSAjO4e77wUXeW9KmPxD1hAIJOHso7JJNCUaigHcCSTKtlMHuVsh4IFva6FKJTtromJHAgwi9ReQa1aTWjZgRR84L3KsnB5p1F4Key5gWoHLmm2RuNSc6DaJRF7pkiay9FXGsccjV1yTB70ArrbWFUolCZ5TYEYlRbiIcfvf6eJUzP5', 3, 1, 1417334039991);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (733, 'ezuPZUy9FF8CSj50MQnSDulZbR1nudLxnZ02ZYTqsEMJqobumA4vBuwJpduDrX83AnWgG3hXlM9uDPR8BzJ54Xsfmbjv1ydCoAFKCTYQLtSfNFOSk9NNDPNByI8XpTXFbjJV6wX0JeBiWqkvUhUsemIU2sj4GRZYMWojUFw2dV1LaxxF7QFzDC49X4dcFkHSQe0TJ2azh4LcHbrIuE8x0XowV8YFply8OC9ABv1N65wg7Tfs3UR2vJnpNndgg0c', 3, 1, 1417334042814);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (734, 'yggVRPwKHPf4tPmKbcP0AYKXzNJVucL9ZNWAzdTK3cCYjIoJbl4sIX7pwSYGP2qZfs6VnahceQdibkHhc86ZHeR0dUSvBzIbbkS3WYcUkwicrPhVox4sxV68VtcOZLsGzyqpJ7VQsO5HRnp8pQRnB8inBORIGRalZvfmiHLR7Jyd6jux5Z7ZJpKw6YiqRUyxlCXppIQj5wugpby2rHOmiV8Q7BaCG81kvtsxeE01XvBzv5cCsu9tFilN2W6nso6', 3, 1, 1417334068991);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (735, 'Bo90qMkVhDuu1JsseII5BbLHPUICXbQwoMm9ifwRp7D5RYdj5IJRkM3HxYxOYDQsmCzowIJs0XnzqLeU2M7wgnc43RsSGxHA3yQcCqMn1c79cHnftmZv35ooWaYIpIwER1YxoxVks4Tn3oJZJsRb8mEVzadab4ISuwjqpBdNyaM9gV86dTzp8b4L5YjD8JMYXmembjFsfYjwxrreRPCWjEQf2fcfiWYudX0Xy02uKQ0naoIQSXX9baYk8ahj41g', 3, 1, 1417334079910);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (736, 'xWkS2ujXY0miPCpyrNTj6JiIuzWsivp1ref7sC7krEsGy263XyWOif6v4G11S50zLEAVyZZpVIgThKqngVNOKdVmDHu656V5zOYjrc9d9YFJhi5a7MXR20AKtGak1ZRGZ15bx1LQdk17fF1smwSMPmNf52GijSXaE8UhFAwUVg7gUb1SvOIsW7OmxIpHNPUAA9INkcInlutRiq1nk3Io81GapjT7pVRr7DjuddRZ6LNKwIMaFqfhUyMnVEPEd7u', 3, 1, 1417334082654);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (737, 'vPBUNyxEKAyRb7Ne5jtDIijFNZTKvlqQja5KlExAiAJmgUapB98HHl202kWIeK8NuHnnZk9Ke9YmRWna3VaR2DKeTtW2uRCS6aUi3jMQ0r5Aa4p15c4bGkcWz9jztO53KbPeGUnsX2tKi1NIjdmezlo69XLEK7I3zpiY3sKxyPmNNUKKRmovHDJRZ5wtCF61zJTcM5gI9QM6EMkKgyrV5HUlMAtR2hbj4VWQSt0EzC64Vufc0t1JMYbWZ0hDzOe', 3, 1, 1417334084669);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (738, 'Amh0DGdJi0wFUZ8bSSHyqZZRQdIBtvOykWTALEernViuU0s6T45mJ2UoqVnJvSKsDnt5O80OT5UaJmWAMNQtZ7Z5puONoh9tJP7JWIZATXheJ3JxpM5zP9pHO0w4gP6CFwFpo3lJ9yu05cAemcYGyUllFGuaR0EaayKadhaI4nY8jRAQiSG42o8TR82kBxijZ3QgXj5t48RU3vgDGmcMT38bd4BRycQh6lEKgXnsA8cS8ZWPCprfyr3YydhekSP', 3, 1, 1417334089092);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (739, 'hLgeDpm08GNVIt8s24OpTcEJxdPxocVWRf9VL3XFdjOTcKZnmayZvVU7nFr2vOdzrOwp7l84oM78bXkdHyhJNlt4Y9ehoX5eZiDZ0zqLJF5KtzSEcdNbmmWlbYuyKh2baOqTqQamke6pr6S9YXT8GuYpeSK7HtGUhiuIeAZGds1VMHY5qjbUuUpw0N3Ry5OLRZc0Pi2u7HiAveoz6nV5G0spvEmi4BbJjLgk5QSAV57YERFWkJ8772UiVAE3Vu0', 3, 1, 1417334096517);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (740, '4WQNMzz95o0GwwfOdcMI5ib9VVp0VRxjS3DGitUglbRDZAFEuqONy9QJRDoy7YazVtbayeCDgZF9ra15RFMEpjDwPgjOQoSoEPE70Mz5mWYVv1e6RtdHt00metSgnnBj91KGXRt1xto2l424SWO83JHSdnyxnzMIDb7dzeSiEx2SRLNkaRkGcQJYd9rApXdcoyGQy9oupP5xsWVm9XIAc5GbFN8dfxfmkZF0lD1QmwyLK9G0Gsx1YWWrnpSfgdG', 3, 1, 1417334100033);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (741, '0mFDMKFwDTea5xOWDm9Gku52Tm36tig3Snb90wrgLAZiGAuGkIHF0FHGzArVxEW5Jutt2k00XZtuvZNlMZpWcOlPdUmIfp22RJm3GLQQRlOlPDYLF8lyVNeMqcLbAeZVuCy0BupUGBm0t9xNTX86aVcjvqJXExzcjCIHCCc1yRihg2KNNJjCFXAH7M9v3H8GJ5vgi8VXyRZldM8xB3oPDTn56UujISdtaFKZliwtoGEWjKT74bU4RG0puBdqlUR', 3, 1, 1417335041110);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (742, 'WyRjb53twp4EcEfwfgbiY9ElCq2p5Xx9CUfo6zyAiM3eW0G4SrZLsSj5YI2JNlRe0CmRgmljUdlcBlvwN7tf6l5aFpZuCSxO1zMGs3notC3an6l2cHuwlGdSa5ACaWwJIn2g5Bb64NzIQAre6dfaKolABXLaey5RqRZssyWizfNHJxr0WnsrWl7mvPEMiZKpgJwb24U62TRDfu0rWWiQ9LMonee3kTIRiR1dot4uczXrZv3cNKMqRV4W6CDHP5G', 3, 1, 1417335041661);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (743, '49dmZ43ftkuBmvRIP9ZLOPiJ3BApUQgk47mvayALyRjKTfVOYj9CalwXRBScdW20cnIizTWONsJRMPPhTcbyMkfyjxj7GIOQfjVS5GMIBQnz5FZrPj2pYRBSwXqxZX5p7xK6KeCT1rXy8URgFLu6eOtbvrmO8QQFDuU4pkkZEaAg4gAQBtBvupNFh343liFZeniJy8fjz3xOmI0R6SXOAoa4y2Kndl3aMvf3DTvWigCMnSQwmj68sEpjfen9M8Y', 3, 1, 1417335043050);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (744, '4Bnj1XP0ToJA9ClDv7wH0ZkwfhYLlE0foBZTEJHTsqDBs7EZ15GyGWPLOHVYp9pWQmP8S2jdSxqaoCvA0ZZNHVW9bbqOHjMFCeLhFJwX9fLsk4CWFwa3aiDpAiuL1u3EFLbfq4YXCkZ31T9UJT1s1afOepF4IATqcg1ydf61ykNi8lWvbhYffZXgA2GVFSN9qSUetoiiGRk2dLXBaP2vP2ajDOJ0A9507sM5E8ljAL12jvseBzpKDTCSOD0rtBL', 3, 1, 1417335043836);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (745, 'fTCC9dQ4gPWp8UZWBbK9pSnObf2VZ0Q8vr8vmV0kItLBZJP5PFn5mb7qsTfzYQojRQ9kl8zNAfIFYpoHhzZfcsIAmXejm0IfpBdP0tHZezeodUiSfY8ccUCIGpItIvsDZz6D6UwZjv4k2mBiMNo4ZNQuyuYLrq8oHtVi0j7VOJ9WbVBvfXdhdXDf1cj6cyfNW61Qv8A2DZJLEjN3QuiGyvLwvu7Ilo135v26KWCMUobrfGMZrjQDKSh4Q7PLAQp', 3, 1, 1417335045191);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (746, 'X7mopRyP3k77SAfpcltxbOxiaZ4nGnoYBRFncRWE9YX7TDOcLYK47NzQIZoWAEW5uv9MZsbOR0tPKh4OxZYugSI2b3uD2He6Jv0ppYwKOmEvoBFxPatEHBMeAV0EiOArQXbj7Ut7it5bCftmsF4jBcWnUlLWxyrW6BgU3mt4YDHL5jA00eJs5icLyaQSwg1xOuch8ZIrThRt1KdEB1pegQkrgbqUudjhWuxMmkfelHblO92Wmqucl2YAP36VK20', 3, 1, 1417335046295);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (747, '43vUPkQm5ad3YtTlQ79mjkEoHfTFOXrZuMAP32psikHr6WqfTtNrMoof0SsoH9VczjAphf64fy2jc83JeH1FIWfDhNR8MDLs236RMlIfr1VDWOSvwLmUYrDFnJ1bhHxdKrbsEbVidoG1LYSHExuZX9StQ1vhwIHZSKYj2DqGuR7qt3nq73e62FDI43rFyavyTAtxR84CKeLApBCm11yxIj8wcogNK6dMDrqNWVEXNSbz8kdbPDFq26tz9Jquq0V', 3, 1, 1417335047967);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (748, 'uH3McXERv8lZBqJ9lRAjhYcwJnm3xNXAMOZSQ93fdQ531A6W2qcfpMXAU8RrWHlBUsxwov1eA2zARpIVINiCoJvknza8uBDFcdnhhgEuxOLjbgH8xzhOIhhkPtmPEpRvvbHwmoiGIvmrCgsY36HbudVFOJ6btwo5zq7K6Gw6GB2kP67fO6uTJNAjvXn0tB47BOPTVgb4YQCBroi9478YaKjOxXxRW4INvPg114NVC7UfB4MWhYiq4chRVzwEoWt', 3, 1, 1417335048950);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (749, 'cX7o88kCr0lIVKyh69kfzDZvsVQHhikYHWjwtqg7VCaYkmdF5v5Kw5XTnXdjkC1NOjkMZBjzAs8fxz0U9xFijhekfGFBJNRmUNbdb4YQ9Bww0AEZBezkbh6qaUBr1QXN2OqLMcPOV3bBrAD4GVmYDbFda52mjbiV1BEA8kUW9CbXSUED5gnpBXbKGgf6tFt4tOb4EfL3Wbtf2xVFg088QvyqCyZgrG4SV5ABXNEOleE2H1fvQKWFEhFQ9V1aKad', 3, 1, 1417335050279);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (750, 'Vlfm1ylmUcPzZy1UxEeK0docBmmVvqHMDn1deyBGBfoOKR5XSZhVcfaZxDuxvHa1eEQuuyLoHz7wUqO9yefhjRnuBjAoS1eXid5z4a2WusHxYhnYsol8aB00VtTBdwYUMrkZvheYLS4LNQ7DR53oT61UHZpYrhnYosqOfUciGF8qOb9iIrvAHiby6QOibWAXTs5w3L5hbvLxK7fgZ5oBN6SFq1aOt3HNdDbEM1H1dRQt2qaVp3ipLvMODSuMQu1', 3, 1, 1417335051332);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (751, 'd7TR2Se0ZvuZTOuKwt1iIX30LCTd1NVaxxJgTRBrbery1m70kmPK8zBhw0ZMyonscUlb5EY04WpWWlEqiTJgef01PZMZMgfHbW3cQc0wRAF4x7IJoh2wdtJvlhYaWNKuEtgfzUvYCn67IA2NbU4uRkNHPRHYzagBB9mFOshVwZqhPz9ki8ZHA86jt8p2kqSzSmjGGxZbK3TSh8vdAPB7BGiRtePl1RDIoBfzo9K5Wykw1RJOkFbvg893XQoDrx9', 3, 1, 1417335058387);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (752, 'iMap09MpsSyY9DObZuV4MOg7mwhQkyzxKmuW8fQVeKIvcaPe0sAqaXv59jnNfNzsyX3rmhJVLNQ0GmSweqF3xs2O3kUVlsDeSmRlR1AyC1SzjZXhyDUBUnU089dobYMSXivP3ibXzmX3JHcUY53P8gszuJuQmkLJmB9UlRqEqikF7Lae8LU2QIiyqvoQU80E6X8mIUiCa2xFtHaYuyYHZEFUrmPsuF1xgxs3wiOohYa2aBCFigcgKW0P9vkGyeY', 3, 1, 1417335059811);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (753, 'OhDEhkEYwu44bpbFgpjSMxxmZoz24xfDPsuzu9gOYeo0SKVvn3RHv6RndlcuouakIa1jBTEUW68LyYJuapaueZaz8EDsq8F8zpLJjTwEfS9OKm8toUIgGPg7IGkCT2TLgPfZMxKl8s06Buzjqj9llLZ3tZ9zjOd7wqiyemUjsVxmZRb8vPWCmsbXtr4FSv7Rmnj7L9cev9MksaJRpzxzWM5egVvH9BrvfCZkCRhqi30Xb4M3OMHIjXnWgwmVahC', 3, 1, 1417335060584);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (754, 'SjN9w108tqPxVjpdKMsvlbz6F9VglwLPnv3TJppBOlMavoFLFH7m0HO0drbdL5btiZjYCdGESEz5pgcPUxM5czo44zkKlxTqpnJ1QZPrvcoOKVAvTC45M3rIPqDwRYJiAHOBOBx8OaLEvCJgyZ5heu1A3R5diDsLE4n6zxt8sP6vX8e5WkigWqYYIJd4nrzKWqqiXhBeD4VtoL2t37YuVGj7tJEEghyrRyqCqI7W0ZHqlXQG0JwXxUJkCznESA2', 3, 1, 1417335062013);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (755, 'ni24othdj2ZwJ3Sc6E4nkUEGlb96XR5JJSAtQUTbhSz8XryiYkYzie9x7zZbAKxr2dEVCWZSV2ggAGboelW3vJhx561OFfMOTe3NkSMeIyrH6HBBzZuKBV0ZGedbzRw7rYA43t1yP0MOlvkA1OjDO6fXO5P9jofTl8LCxRPRc5eVggbYlZdHVLT0qC61mhmTx1FjDCwY4pccqzVDwZQY7GCVFvIzDaB0GwOiX10ICHFBb29HHBBdBkRK66mJSjw', 3, 1, 1417335062639);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (756, '31Pmyz1x4dAbL3Edvhi09j3I4R8oJSdMxtSpLfg8ekdPtKG8VeWu7jl4wj2zRSB7BnXB4ZxIP8L1Igog91Yg89OwAE4Pyk5fokJJOlSInTmfYBun8emcU7pkjVhA5miR3ZzMNSZcNXygr2CukP2UZuYANyxpCww2vuPnBYzRcA2Cx4ZmggXi2uYQ6vB8wcUGRwrQPa60Yzof41jaMO9VYG5oPyJygJ5xBBU6Qi54xZJiZAsRpbwyx6f9QQivdGJ', 3, 1, 1417335063893);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (757, '8crktwviIVACw2MLPpsRs40czMaDAepJuPTtCblZp0PojCRv5jYRe6jQOXSQx9UxDa4mcSppVtBmyoA7VUBVKeEJfPAS5ZgsNqPP6LBoUMYdwYwsdAYHMZbmtAdQhWUdZxFr2tFYD6SccVzx5p3sbEeqgpWTccWixWVxyQjeDcWADsNrMyuWDYb8NjsbviSeaGC8EKEKjSBqgKzQfX3PBymN3pyxra83OX0axctunWBMazEhVRZ7ncNu3eelpZl', 3, 1, 1417335065078);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (758, 'fODQdpCbsNaz9FzE9ob2KiNgo6gWjgOZUSj5nTpdmj0LedATTjUccjpDlbmPREBj3RKv9ql0jE2IQ5BTvkqXLYc0qCAKyc7aJPBe1iyJoqaRLCj9HAQB3u0CV68PA65yIaO7JO9Q3ZapApi7DKabs3uMuI0q1wRAQN2p72mWVKVX6JYWlYAYi39vYE4esuhvLFaqIn3axzaLyzo8ajcALr9pYag3tCYSKglnbyu787negkjIabVWI574KlWRxo6', 3, 1, 1417335066267);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (759, '1vc3CAk3nwb8xLDZxUdNpqGGmRiOxRLAChmKrShx4GgYmPPsZXrd3sS3jc1KVZHVQf4GZjCPiCeyadBDzF61A2vKuI6WehkKIpLIvtjKfGOuZM3sPyTM06Ga9X7xNcGNHwr2fm2T6KLV7P64yhjicfWQd8XFqWjuzUf0yHR8A8iLILMuAQZ9Rr7r87FYCF0tKF8V7p6e3ploVlqBtm8LwE5yltbqXtStY7p9wG6CRHFqAhxWmcajAKPpiqOEihV', 3, 1, 1417335067158);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (760, '4Ozo4SiN8NzDYC89OIh6aIAxjoa3cxJlPlMJHFENk0gS906m1LKGPun93ldeLSv5ganEoW9YDLPN35oJ4OySIQfHOzoAJBgWjvJmKRPD7l92qlfwKbVHsexG2gUCCCxHYxuwjPDT5q0RPtSk2fD3zNhhDp9r7Y73B775WRk7NPS0jh7fHqVfZ6dBHgzlEtJcOLKJsB2IYlWzXs2OysJmkKv2xnuPpzavd5DexeFs0AXNOsFRtNc4O1FlE9fSa5Y', 3, 1, 1417335068565);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (761, 'YO9s084uGPj3msRt1yHuncoZ61hNhnryvnRjjZMg6qaGHdAOt9FitRgOdWuoV2oIOzuHf0E1YrMrubJbL99IrZwZRh0qtJiRuY9CjIPUTr09yEWNqG55fwj0BAD63RyGijCmjRA46M0R5PbZY8iLpAQg7fH0w49mnmcPlVE5TI4WuhSTswWAKi8YbLOQQiLAbF4nroIOQmgpLI6Yd2V2pSryQLaOl4qPsqDcEA6MT8lmnlQKBz5EhIOuyo0OREW', 3, 1, 1417335069701);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (762, '2nujYSJd54b5R7CVF5KPUDBg6nmb0YWIh5ZxMpTnzLqwHN8kojLidyiFSImGFKUl8mF83yK8rgYpZbyO5w7rBcfvjF0A3Gfj0HPdcPwba1yG50h44ttgJ7xGsKH6ft0JUGFHB8QICzzRn0pMtFERVZgxfLMfYC1Rb4tyhIQXizoBV3fGhs87t3K1nMAKsmHpYxBt9DLV4kgj7gcD9LgoDvY93CGzKV5SG92jELG8VPsvLVUWbGmIp4ugKbnf9v4', 3, 1, 1417335070617);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (763, '8NG5aURHI5JymzHjf1E2CBHBomhhDXxC8V2pwDT4AhKnkrFGqEnVY6G4DlcFO2T4wJQAQcxrnxwbV2uNvUySq9BlzlcDLGm2mn3Y0nnEiXGclnjcbpF0TO41GjMX3dZO6SYIQlrmZmVw4z4eg2vBC2fwvSLu9HhLnNoiijqZTMM5TnaOtY4zBc6hBNcg863i9Wripjz8eaqf4arQgB1ubl7QcbOZLhxsQ55Ivo9ZjIIofGvTodLlSJGEC2fqu10', 3, 1, 1417335071317);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (764, 'AQjWTOkYwbHN1qZbego7GkNJ6fGXxg6dvRqMAHxkRjjfSYUdGiiBcB1pIKjm58ImDskmOvASFknWyzeSiNMdLJRX7JRdN7FaOVhcim8PSKokjRFXwLaeZKjo0UGuanYdOrYEAxfUa4yzgP1V6i4rGoIxHe2Xu8cev6Qq4sztDkkqOEoAT0r1yOjQa3oc9xYvECAzQu2Qv5FAm9ZZx3j3l4DXSz1rIIhAzCrJpn4LzdEYIj8GdaVrARkgyjToj3O', 3, 1, 1417335072756);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (765, 'MAPul959ImH9bzRulTaby4AmaSzWbWW4c2GKN8vPZg03n8pTRSfFUAHQmidJe6eOKzPDhJRlAFWLyuJVQs4zQwZsAxupN9skeXroMdIK7eoWR801UKDlF3lsVUcHPOk6CVMpkocGTn9C4XhCuiHSZjnMdrYYVfuLiMqJeEckjNYe5OEIfDZ52EtK20cH2URqkhidQQV3MSL4v3aj8B7Ct4lffQZX6MWuzre40nkYvPVIcsuCB9lPIuhAjJ4IqOK', 3, 1, 1417335074206);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (766, 'wj7hlBnreSK2D9qSAuJ7vdsYo2ydIQRZiSWdcKxAU4xoApB0uTI1rT5THVamfGSg7vjXz6rjbwrUhXwTZgV79fYzqKgCpfGT0MPrrbstZQOwhKyRoT7EpA2kJln16gC82ncjIg5SMATs32uP5Y2lgRLyprzh24Yd9GJCnV14mMWrXCkwJQRQJI8R2ql1zSNK2Nc2DEQliCdMmuIShmdCkdyUipuvWcGIPid2F90gmOCcoF6dsQxRqm4p8S4VBYw', 3, 1, 1417335075608);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (767, 'oXCxJHtb2u1MIwArle34lXhxDJPYfLpP10AmnqgkFerUhinuTAza0KtwNfvYKgqXQT0XONx0qRkvXltPJvri1kfnmbVrpdUldb8rkxzA4F6jH6CE8GkNUwQHHzt8v3Lsgu38tqSKpW4zV48mXT4oA4Zic2gc8UB5lhxxt7Qq1i06B1IsRERPtZTZT5RuWVfqxkUT1uJwpg8t0CKln6VVVBZLEAG7VM15EgWK884y5dXxvkxGtTmQ8HnuVNSCYcU', 3, 1, 1417335076653);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (768, '1HoUv7Xm0aQGaUqQQmodxFysxUhv6LTnv3GKiYoAZUIsdw3ONJ2rFTfTmN0A7mHPyIkYtjJebPKaAIfL9eHiKsY20N2a9Nn2RxAt5dwqMaMjzj0OSHyZRLOFQdeJS7Vi1fKdMv1zmwlZ9x89qAKtZ6pqpo62siXVEIlg7XL6RoYItH0WskusZwl8Rsfk15y3ij1EEx7YWuOwQlhLVBjymmyTatl6Lq2sdC3ngMccUQclY6j7gFVC75SWi0axYhT', 3, 1, 1417335078103);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (769, 'y5KBNdqNparvpbcHrGmgYjPfPNN3pQv4dd9eSglMWC1IHv3nuQ2yPVu2IMvHYjFbjSq8x2gLdg4vYXvhFREUO5kV98X4BJmrNI5ITm0dQVhL75JeN9oYk7yo5Bodt51ecIJuCwBfAiyMxOB0jtDquM5CHvmT8xB9DTFDEq3Wbb9kJwYGs9TxNHZCufk46RCflHIQhxR0l3Q9aa4yZAVbSilqXqDAuUJT7zqTQG3P4D0PKneEkHCVtRhuBJdrAEC', 3, 1, 1417335079845);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (770, 'K8f34kZyqcw6ytznww014ZMXCta5O5SBhQ1wR7zbSNBHKdUaf3sNVlc1FRd143eYBbZIquZ1jzna7WeisIpkHOUofL9SSJnYoGLiWf4o5dSyWvPOUYeZ0b3jfbtbFYsJKypwF8e3k1KM1wRqlDk2V1z5SprVk24RbhSUutHSiOIz5iNaOfI71C8K5kov4HlftjlxUvF7c07AG5kSQtLydxrTWEZ3qunK3Ho1ohUSBnslnd2pdK1culfTsW2YPeL', 3, 1, 1417335081159);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (771, 'EmKXkYUyqhcrXVoNT36XtaGSo7X0wDeZbajSnfMHodrfNlF1DVFcA6nukAHvpD8vty9ACNrlmQ2ZugIGOVD5yhJMOka1skayBTvPeFet4OrXINMXopsiwpsQ04hTM216Us4pNRdyavqsH8WGWQMtOahz4Zu2bSpZ8E37SnoZ6FUgTluBCBkfwn3qP6LUXAuapj3miHWcbjI7g49HXZPRTz94htyEg73flJ1V5Pj9dGMYMRPh0zPdOcdSMpt7PLj', 3, 1, 1417335082249);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (772, 'Uu74axk2HyjiVC42WmVbNxORcpIt1706AQ6nBB2eqXQhqtHGR5cHdPgjfCoetaqokMT3RH66Hib5HxTVmQADMfEuFEME6UbWmI7JtI2SbAooBBevJv0wx8Lfbu15ddS5JHK9NhXh06oWB91g7d7IzBrIkTgdEmOFxVI2qrJjCXz1zmVwT75Vc1Go0CWKyig8OIhJbz66zRYm3BBR1IQrx3T8hSwIapBRvfogyoYkXfC42vU7kjdRbkIaQKIbVv5', 3, 1, 1417335083712);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (773, 'G4oY2aTe9ArISTbwlcf7IKB5SIDxR4Jdsf94Djzq4AobuDJ1lyJ6bm3Pmla6NDgitPWj1VtZl9BqCKhzppsBK6w5h1VskLsm4boeLta49TqopUcmP5rsfYKtb4OmLjgHR8zm4C0XWC50V4om3Z8IlpelRiKo2nP28UkgjODLZ6gYEhflna5B5SDF1IKBqeDvsf0wLRkzR8qvEPf7Ae4lr26PazJpGBvPiMNs2zH3yN3rH2hYGItFsuu7GAzOYbI', 3, 1, 1417335084513);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (774, '2akKZRDoOqO0p2SiBaQZlEtYtA0goYZxUAktNdXqWDbFjQxHWQ6WIbedr1CdSY9hD4XNGtCq03A8vNSMXw2m1ER9CyLLmrcUvaN0cKksM59K470govRqanUzC141wEh7IEE9BHseKDuoChTCmOtKT70l19Wb2uv7SXIEHnluMjnxBQeR1uO68jAg7za3VPhAEZZVNmDpEP8qBnc09HHT6AGwJyumKdrRQ5hrtLtJSqxbNNuF23WygPA08ImgKRG', 3, 1, 1417335088725);
INSERT INTO [accesstokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (775, 'ohneQApUxdv8oz2ugQnWpuKlcqwKGDK0adFJjzb0GiJK5O8bQgfx4Wt8YEveK0eVD02b0M8j7FSYn2DnLsHCQm422Hb6EutJdmJ8ehWyHon4U9UrJSsiOdagLE7k0QVYYuXU1fmLQVMeGUhn1zaD95s02EXIOVOHr799wUffCvK7atjFDDrEEjGbmo1YLiV7FbJxaJqI6dAkyuvaDbq4SDXrZogeyLzBpumwXSBTQ0cqsfVFc4wBQGiaEXHxVif', 3, 1, 1417335090008);

-- Table: refreshtokens
CREATE TABLE refreshtokens ( 
    id        INTEGER         NOT NULL
                              PRIMARY KEY AUTOINCREMENT,
    token     VARCHAR( 255 )  NOT NULL,
    user_id   INTEGER         NOT NULL,
    client_id INTEGER         NOT NULL,
    expires   BIGINT          NOT NULL,
    FOREIGN KEY ( user_id ) REFERENCES users ( id ),
    FOREIGN KEY ( client_id ) REFERENCES clients ( id ) 
);

INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (596, '0VcxhYH1IdLdDIm29umkLd2jAnEfyjt5wtFdVjwHOHPNrEQPaKiughtHRl1XcvtYnlAUJes2gSY7LLm6qaVbkpgec07SuvixXau1Rp5lYghRSHKYuEr8deOxoxscxLzw0mG3VNpxUsUxWs0GAel0J0CFXBSgz79Z4eRlvdQAruDDPzcILFqow1GE6WwdCgmNSwZge0JOG7jKFpnfIw0i8aIEsutabQ8htvdjo6eEFrtEjQgUCbye05XlfBfTQF7', 3, 1, 1417388923083);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (597, '5icQ1lRPpyJjoenILrBemaBbfTB0ZmDuNxS348DxqPLk5qVTX7qtdfVHB6XXdFxVihz8q5Urf59GhHCxP0GKQJUSpnXT14MfiaV4hIxw4587zr6mD14vB9MVYUTEp7tAmQKMXRCuR3TC1wJ8CPhYgqN5NyptzW8ZzjjZB8rjs4mHK0gziCK80AhSpKXxafUjkyRVUX2EUl1e0gfmhdh9PdHVN4AUZoPFIK1uLhF1BYuwIxfEqqi89agdY1MuNPD', 3, 1, 1417389429980);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (598, 'pbXT7bMPIEf3DSh9FSNii27Mw74qsF5kfu3RRlZnk866y9deBgpYSrrF6v96DmY4rtb9izLzi1rUNVuyhx9YOjrwn0bTJmX9LuapLgvBzDEowHUtJf0pm6l4K15iakKQVgDfw8A62rwACso4Ptd7aIFZXVtpIIgV7VOxFT5ZhpmHdmkh1Y7EbvxFIfnRrwFxHTNOO8oJOcb1DjAZqXFU8BicRr42hTNHb2wFKmtbCzHv0KlFY65v7tt45MakJlr', 3, 1, 1417389515700);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (599, 'wcY035JAsL48tmFxaguAykwQ71eaFThnQwNEVyFu5FBcwbWmHZOAI23ysTvqgK5Lt0nRdHLM5aTe3J5ajUuIOAqq5fa8Bje7eLPf7aR94tsIhX8CT4h7I1hlaC9i6tUbtkysdRIOolz9hLBk8u6hJVAA1BOYrWl23Z5vOeP0aAtuuZKd8YixdrHQJUuAxofNZizxO0PFs5CWOISgt2wrIr8d58GEWTah0u2oQhgGPCj81XrcdN8SjZR7Plb0xNf', 3, 1, 1417389862351);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (600, 'vhXNxrhJOpDZfoggBEdD3smoqeql7y6Sy33P6cOVOGWsX7alBcXop5dLusoEwx78bvD710kXMcB6V0sJ4PkvaDJUOE5xTAGOwcTeVM9N05242kV9hqh34Nl0Rb0yX2UG9FRGOWuN7GnT5qgsnNxiEDQNIAqwR3DEYeecRmw8CJmva0JUCG4fDl7iNkqT3pbShIM2typRKUGySSpLPIwm6MMWQsXlzfQ2OJ2117sBIxYwnc1dLlE7764DJeReYjG', 3, 1, 1417389899573);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (601, 'InoVU5GbPOlUBSCDIMPkEjNaDvsuUYlyI2GaKAT0VeKidpw5aWKOSbzvKQbJa4PLHg5wroqit4YEjA8scPnf4Aux45nlATZqHlnCSsc7W9IrMgvxsPFCp7MMffScRVBY1Ef16smcGWJv6uc1HBTcqbd7uzsPJzaWHLaWB3aUPlnXY81TQP3DED67JlragEWTZTk1F6cHauv3hKDjufk96rBro0bX1DHXlpTrs69l32KfHun0EBHK969dSKHS23h', 3, 1, 1417389947111);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (602, 'jiaWSvuszwtHA4HDlKC4VM8n456jX9xeUqmSoFfpjTpBKoZPMvxuqWuUIUmG7HCzaWQkM8fEYP3v1d1hc1DOPJSiIbjivwOcrBgzaKCNF3SDIS7AgMjCqlFPHC6lmJ5gw3AlnwB1w3MwF3KDLWmMhiy1Ij9nezaRPjrIUAHnDmruS3voNxKs6DxXTPfmvcAwdhIJ3qelryoNP7bKXOvMaIplBp7aZk22BI0UrN8yrScOSJUUN3aVqQteHJcGQR5', 3, 1, 1417390107779);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (603, 'AmaY0J6Ywm35jhHcOxh406LC2NiBvmmdGm75hx79tMfYaTEqXsiOG4hnezOK3yZ0zBjPr4dUoulG8jNQB3uLyNnsRcTvsJX47doyhBOmsJ3F2PgEiNLMh9IrrCYDDZ44BD93lw0EcM3Z5WFuwHYDPZ7vyQcSZRGoHc0h3A4uvtVxR3ZHZnJZPedRnlO1uveatbi8s6rSKGI2fyr4Ztcikjvy8jncps0sYeoMXEMv2ehQLascYJ5KOevGgt5Yjt6', 3, 1, 1417390247913);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (604, 'U2VZEcH4LtHGLbKz2LO7nXMykWuyS7SV7hbY39CxCUJjRnvMVeGCVQVyvSaaC5SyJKgf5J1On9n2rGCYgzNJflHJPH1wJKPYRSIHJP1tJCDv3LUeAOlIcCmqhgFm4GrmC6I3qAfEpOW47onoevOcZSKbbXc7va9bO1bmT5uDEvCuhoq2zlr3rj4BqRknCNTkDG3bLsQcCLFDNAEUIzOPcWuvYVostBdTWkzyJYv9Gdp2a62Dc5xVcBlWGpB02IW', 3, 1, 1417390292688);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (605, 'lE29HMgbicoS3GP5Mo7605i9V9MGtvGw6aDBWR75FmQmjMsCDQ9FPDHWBRRtW8HHSilcabuLTOQx4tHvPsZ3Y5eDA1FD9C9ivwfad6etuuFfD7slcHSERfWODetlTzs4flZRJiH2wTa0tQFdfOjevYQevnFafg51aXxw1rOBC1VeioWv84Pn4CQMBld48kV2X6icfWQiYLq1kP5uQ2ba3MDigckLRXppFSXxqCQ1C5IUY7r8YIQlEHXoB5rRKgh', 3, 1, 1417390348020);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (606, '2dw9tsLC5eLgGub029dtz0vg6GXF2VaNRJyNH7vwJDb79PSSq5qZOAhUhpTRTmFDBPtDMX1j5n7I4kiKoddVlx36ynkM1e0iIdFV1ZXXF9JEZ9sUwyIybaKnbWd4jpUf1DvkdwiVgflFR0hlHg4u6Xf8372KPFxLBFkjVZUEC6iLD8vNkVL97BgHAio65rrH2LSqEROr6pu7Vo5QqXDoneJgN9Zpc69C6c2rzedvPE1sdrE0RWvIKu6seBEGTeZ', 3, 1, 1417390470207);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (607, 'KshXpaKPimTG62Yik5Q4s6KvUZ2689lHyEGSaWJpnFwkk5BSnxnvXmHIyNlnsQb8MjnWSPrnwJuMEINVecdAzY0bVFchf81mS26R3DgXT1EpWKf8cPjpTZUdhMBSxmY59g07a8H56Y8TQ2SVrLsJ1rDeZMLKPm8GFmJV3f9xyLNGBdlKJmZEjTbO4CjgM9dOqPqhRgKRkWhWV5G7ZHXVwgUiqVNuYyVs4kwgS3H9SvLXH6OHdWbv7ViHKPmFfux', 3, 1, 1417390497631);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (608, 'YUYPGt78Q0Sp4JiqRBk95kbcWEStVPJOTEEtKICIj5NGphboslxWcKntL5GQxBzsEfgxkuTCqOiqVBQykJRiROm8DyippSIphpeVrcygRBQai7bQDwNZ44oMeVjVC4MahMo70GevkFEgfGqrGl5t9C0vsyjjcoG9UWFqoJlgNbHYGBuUu0Tm9uw2x8LioltamptYO4PmZHENa4XZqabpVDxfRkv3H3IlVWx0Il0F9eQ2pRJL5xEGaKSDNQlq9Fo', 3, 1, 1417391188722);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (609, 'dTxIccoC8t8O53XlDafxI5NFuWDMnzmPqmnmdU9Afk5gpBv2p8N2RrxgyH7dcQmjxPlYtUP7USjR3o28KSjLk6ElPWoNP49dWe0p4WMIr0nPwA1xHYLcKSJjd9BWKh2f5oZHrUPMnmUMlS6Nbn8crpUVPIZNg43pkC9HzqYoATHgNalJkJYI4jgO4DTZ9iAIrzABpbdMPh0er9SkSl71sTn8R4SPCyHa3mGs5TPGtwIv5WwsDZLx9U7OlOq5Eac', 3, 1, 1417391193751);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (610, '6KDSgCXIk0LNNkx3V7IMEvNgpU3BThPKkEmcuDGkuiavrT4CQ6X6CrWqDy8ExFTcaMgVBMc82nc12fJwQqYj9ySyW0wbbV92conl1XVNWloxzetlHUoG3Xa9OaSDJBM3DBCWIMK4xjGSNqjTxFxRRHltisXPT8cPz788vWa2LNd2jJENE9iOukZOlLkwXrhqIG4wkbmBWm73nJRHuP2D2WE7D0v3Ft2PLJEeacegOy6nfKlnmu1GVYtcYDu61PF', 3, 1, 1417391252084);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (611, 'fB1grEHoGndzMoITNwzqacPLxR5qH5cz33lwAm9mUNrurguPYLlqF4wAIWt8ITvpBquitckG2QExixk7PeABfyQwvHAstHL7LSha4FNTaHyDLcXuOCzauMgOmXkfBNOJGGx5bf8q6bNoaWxP6siWApBjkr3hGeWdtFdvfITmU2hxS5bxFQbRHxDzQsNBHg6HOfdydn25gyh8OdOO9fDKKF0cr4yTrp2JFXfWeqU49R5Uz247NrnKlW1Efnr7G5D', 3, 1, 1417391283350);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (612, 'sqwwAZVqmL12g538t2OwNtMfPprJCzoKMTXGCvogTwuvkjKvqdjZHgaQGlcUgoAbcKJf7XGNZqr33Fmi3vZ8lfn2HM3nIAjdISbPBTlMJiGoDyrvf5QQ6KFDu0jiidEpk4CYUafzAWw56WGAzRp1iPVxKyGq56kmlaksXez17Qbtvr4UklwhFse7y14xKUmjcFOzWP7r6rodkhPpuNXXp7lwaDlkBcx2T27PwTbszvXml6092gnugBXD1I1mShO', 3, 1, 1417391310833);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (613, 'tQU61OGdjRvqxOyS3tZ9cyhQ2rLabVK9cngKHCGLeoulcS7efQKjnEMyLzUNJXoV2lJKtlXZT3NUjtlUShtREIktH8XvBsaWi1hsaVQVARHGchZiaUgCb02eDnH9I655pbMPgtSa3NahY3TmY0oJYEPfmhwtgMqL0lfwdo6VLEqwGam6iJ5CV1QG8RtqVAEot1e6x0RxjDwhE6tW5pMcpaJjlsSD3eAqNcPOxxv4D4XXasbCH7zNJYr8kyB8r1B', 3, 1, 1417391326160);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (614, 'OnT62O8cPj49Cw7aPRCrVNfhhjQGaV3KVafeslPH9AxqZFWjPcOUA2KqMNPxiWkNUaDpqooAiCT8gcFFiknIxH6CqvHVglReyhBenOMECIas9SYTqDAPziGZnm0p3Z2LZzYpIL4Fh0goxm4nYdLMmkayGxoCvQxRoGLLHWpRALlUUDRxuub2FdNh46iT640uPy9MaCMYg8SHDOJbrktUL3GMYiheEhwysjYQaHBpg1JHJOOCNzIyHCSGAm0rQoo', 3, 1, 1417391342559);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (615, 'CFB3wfGl41GNzu4LqnITBO4OxOCZK065B3ZhWuNct1fy3wGhDOHDSV8oVNl521haZNSV5yicS75hlqKhAuVsjYleNrFr0lNKkhJJJBch1WKJKwTCKzCWeuyZSdlAYYCvbTZ3zrneb61GBQVyegkU7UUWwrMNXO9jfdJ7Zngo3sPbmqL3EN7Mli1ZG0Dbk3C9lANIVYUieOeL96lqqsXOf1QJOjAWv5gZFkilmvlPkNbElnKORuk6bcoWJABzwFp', 3, 1, 1417391360570);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (616, 'cHhy5LxkbRFANO5AYHZnTvXG9p6enju2DxeitTpVPTe8xRgrXSbv3F6y7M0H3Yi1wxvt0YDGQxx0dWlYwvBpV5czL8j4l177iGY0X40MFTRn4CMJQyzkkbwsBlrZL3jADndPpUaZKmDKUvO4JJplGe9DI8yeVtALiUpgioNaPvr2CLCqqhN5w2PBmVOPw1gGvSYuudsIa9S5dlWH4N5dtfpNVG6pX5E0sZ95CLQvWhB7SOX6tijbwhV6iOmga0j', 3, 1, 1417391369819);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (617, 'UC0ajk1ZUdEfr4mOaEmjzwqhHKKJi3TBDdbROpLs5ExIZ6ctpzkmbckoaRIvsrAoeVnYt7gt1nC5JcDW0Glj3AhCImJzEZQc4RmIoYcSguxUBcl3w0q4L0YljzsOdPXsjQf4HqyJ99AVUolODLzsJYgsVCj0BnSLQPFDxlriI7rObtCxsBL3XqtJxFlUYtLuek7JWUSIUiHnvbTKckYfNN1JmiCc9c6aZhujkT8JzOhIzqbtpnz3YmU8GTylEBh', 3, 1, 1417391446349);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (618, '42wgPAA8jnTY2WPdsx7IT6j42ym87qO7BQp4U9LD6poXl2WzuHnIGK6O7axNwvC3WfS0p9vRyTANtIyHc49LA2B51cHiH7mij8UFbL80NfzdHUSLLeQ6W0WLNe0FwYVAR9Sd9TNdFcGVB64QuXM5PcMBO4hmeigFRnvYw3Q1VL4Q0RzppdMBb90ci6BFt0Btw9XAwLNCTQ9hYciLFwN0SaOBtEUZO7PehMVNcoGrsR7XCjESIWkZeWo6O0wlfyU', 3, 1, 1417391454851);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (619, 'daUnOL7TEE3jxvPqJaDhdtq1fxBqfKRzFl5rkJeYvA9mCyfhFBFHYJsHxEYzXdpmq8H8ihtlmQ7pk6ca46i0TYRsMEQWu3OsAviSgkO6fjIaE3BU2665bAy0xijqXhP8JfM4NjpqAVTan5IGSABRgkXCnueAlg6Wxw4rGuoltdTIhAihaaUEUczOxDVUJ0IZ3v7IiqAruhVsuS2VSE1k8ihdgazPQAxibVWCbHUM217FIzDXADZKo5MiqBRqGXi', 3, 1, 1417391507707);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (620, 'jr9VvtvgYdbMV85Kub94NoEKtjqM3UUmozQVgaUNWE3k6X3azFs6DaVfCXRkzXZaMMzb7d8JO5WKsBYTzYqX9JOkpIU6bnSqPoNZbgANbwaUfttNVkjYGpKLMkCJBdpP24aamu8CCzRq5OKDrSgAQEQtuN7vMlKatdZ3YiDFKPDsKrPms47j7mLe6vD7GiCf3S31CNxDDONEBORNtHTAHxr7RggWqbwNcnQY2NvlqkL8P1NN8oo5kXDHTCfOrmL', 3, 1, 1417391517283);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (621, 'rrjdeZxzl9q24LYPNzIVfPliCZxP0yDB33GxqZ4Dm4mBjDp3kFuaumC1pZ57DBZfIIBCIlmdcVI7H4y5MEeYC7ydBILx4iWdlS9YXyUcR7g7c00Mkhg8benTFkEOyXh2fZTN0KCIAyA6Zjdsr8uFYfY6XNKr8d1Oaue6wcFhOJsVlK4L2JhlzxgbWBg09ZAk1o4yx1ZP39U3TJ1qdeRF8TXGdt4i8GV9UdlhH75lAxRs6kwDTWZ2fqhiXQpJnXr', 3, 1, 1417401142146);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (622, 'gMIVJyOBNiui4JnTooW6tgPufA7nzXEbE0n4Bt5fWMgbQQgehrav474kXKkVgWpdj8CPPluGVqAqw4uSnynEI9aTCzoFpIcfe43RSZOHC2nbUrWebRasjD7NlJh5DWRRR5kK9jObDvNPCp5IsSoFBLzubA5JynB7jTGmdupyK46gB3IGbD5hFeZMq5yvKZeQhA55Ftf9l1yzumB4cA189TTsYlZShsbGuQBUxKod6yaay4qOUzQh80Nz4akpbdN', 3, 1, 1417402744519);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (623, '5uiUMeuag2bmTRuDyzUEJQpl6IWTzLM1zhtscCOlWTLobwgw1iv0iqGTubZxqen4rkpGc3ijRLGGOa2aVVcocg9qoMtINnMAg4SpmdcBBwaEQ6bymCY8E1mFOMuwzT8yNv209qxudXBI40JwdtPCbNsuCzapylZQxymIELul1c4QOEo73K3KMMLlDqtoqVt4MWjs8TETDXgkiQV9jyTRQpb3faHn0CZT0IITUHkPV5vMyWAKyfR374DIPqxrM1b', 3, 1, 1417402780395);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (624, 'oiUDrQSB3UL0VAC9lltic7c5GJctnUXriM5xdOlJVxunjlpOGHLMQlBPJ5Zo3t9YMH3f7RePS44YZcFlVQe8HP6hno9Lyxkcpvm06rEKYce41a4uTp32XCLvWojjcolsu1vF1JN9PoFdHrZiEo8e98IMJR1h67rwlt1nGUsPrts8frQ4vG7MtrXw3PBmt42enCeBnpPHPM1qBpkinpNODvqqOSdqU5QyGqfSavgeL9eWE15pNfECwcH83FfGFY2', 3, 1, 1417402819317);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (625, 'PiEH0TurDa86bNiKIriKfLsGz2M7757WaLOuzs2XfepKij14AhIb2jYKHL29P0Q9Cavzqw46JsTNYNCdFP1mtO5vA46fxyt7ggx3hDGKXyL8zha1BBBHaFsCzCwhbkrqgcLQmL8ihWIeFpjXep2WuYJlRb5X5QsNDRj4vgNRIzFqufogB8iH9UPbyS8XB3LyXsjnmh5Zc82yVVTkKS6F2pTTkhDwyH8xSUIqSlfoRHsoU3AE4Z0d4ugiDk63gT5', 3, 1, 1417402835682);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (626, 'SwnSrNg9zygkcylo9p7uWFRLFUBnAH3BlC18OdKEbAN79by6lW0vhhqp0paJ0arc9Jo0IYHFwEzz43J8JKuts25PpeTn60l3FUmNhSZYTXrO6t6va1pRLIkFeyfncFF7DniyrYTIq0uJhIpLdMVUh8J66GB8ndUtYabafj1gg3zJCHJKLFho1wQjKzoePSYNRj4CpZj7tc0dbSMVUHLSa2OjCyCPQ5VaR9YF49vHRx4zkB2CGPriR7FqN3vejf3', 3, 1, 1417409740353);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (627, '9NYcfNI28wDvKao1WMlqnUQXFsPnNyYPqDzvJoIOvviHyWrMXazHEe8bhRCpCMdDu5wmOK1OzabGbvHxoYFRPTSMn13IRWNeGpQVgvT4ZYwyhej9lMJQFoU3fp2DzC0zNfvvG5EitPBd7r0o1XjZGlqmRLA3q2JUK7dQjOrVa5rxKfN03O2tf3zKOFlmi2aQEx6ZYE9A9Zg8jpEX0uV71q4fFuJT4YeoHsLjmuDyJL9nr9sMyr0K2p9qXAa09LY', 3, 1, 1417409745330);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (628, 'V8OGagyBhRyGEH1LY90NVREQUmf7MaFabrj3YOqEaKzyrPFQIFOnTyW6vHAAgkYqsRRG1Irp5RKC6M9mEfkRiZ7Mte0w8xANSsc2WVId8bJNNQ5VuOkiz2mRR9J16QwPbXzKvaZvgth5eYkFAj7ssGg46TXvlJiDIc9GWOGJL2QCKPr3KeGlKstMBOZYPDv8270gu0aKJUynzbXAN7PGzdR0r9wX71PbMo5zMkPmeQoeEUZOAda7BsJonLC9j9X', 3, 1, 1417410130802);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (629, 'subVOyhkP4C4c00I41lk14ZF9v5W5DACLq6P4KDrCxqBfe0hO27UnluuCevju2s5N03rY9NGOqVgQ3mf8MCv5q636tLac0uHV4Pm5e9VMQvAYSmEVvfB9TWHHQFV1RXFF1SYc89yHbTxPasTrGyEBuAUpPhQTtP9XJ44Cub7ES4es82o8labGmCBIggMY8BTxV56D5dZ5WeKjCYkqBNYEaC75qCYQ6qGZeWcXyDcHsYpmUEc9JvogmQRBciRCWa', 3, 1, 1417410263406);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (630, '8lXNEzOASLrPGtCw3ZyPjSF0j7IkM6y596Xul4GuBhNFfef1p5JdY09YpgwArABUWI6ZvepeUps3WwhXvU5yUguB1DpiqDZR79fDC2bTek9cNnPhkn3Pee2R6r4wZGA4GyE7A2ziGWsHhvgeyZ5D9VXQLkxv99H58a9CdUsqtD9bcLg1tYJVBsTo8Sa9TfeStC0X1L34Ukob0R40pmQYWYd4FlTsf9IUObKvyo9s2q78Z4zrV9HhhIlwEBBkl1C', 3, 1, 1417410360136);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (631, 't0pnAMr6aAPmXyZAhxN1MagX0fxM45n1Dz431eJzTZvaFBC5ulYYY9yUII0lTL7XfFRi17tnYGvKQBjTxCo42CbmUdlRuKmYm1VNdaRj5Mggzv2dWnQWR3WBuXgWcrAXAmcS7oJWvcEiJs8XR4NjjeqOCEjKVIGwq1vfXuttMsZWHn0V6wN858J45oZrZq7r7sw7wK7cMFN9uRLZc4Fzw0ha7nTqphxRoOwPthDikd330EPjb7u5p47bFylOrvW', 3, 1, 1417410380851);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (632, 'D2wtOurAF9V9TOA6tFtM0vAj7x7b5n0wcl8mfMSQYLcUFIkzJCbXvjXy7NdBcPjecvWhx77VMyoFqL2YQmpt1uVHSWbsGvmAnta3rirBHkX0L7J8dP18PJFcXYFhJD0j8Qvi43dsZUvI5q0PxIMq1daxwQG2v6j9WKG1iwX5JuiwcPN4kqYdS8WF1PTSvGUUKUXlyGhneSqtHiHF4kMO7Ei4MpkoRF9xITV6bv68QYAGLVtzHVGrX5DKvMykFEc', 1, 1, 1417414752058);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (633, 'hStf5ohMf2xpoTph1hjPL2LEDXv2Om1uzVSTqYrQluxGjRb5G9rQ1pRPU6xCUrs02whQswRrjNFVudnaf4FdJnbGvJe15SijqjTKH6HsN3iblg3p7HsHRl0PeQ4JhEcnBqhScKwSydTTr1hpuOHhwdkJMLwfQUOacsVLFYCtju7etSuxR7fbiwaLEQXo8yb049d9dNaIqsgjRV9cSTGUxvQVWmXl7fPMpYKT5VUTtcOnIyD59Tqa2pSrb1794rE', 3, 1, 1417410438765);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (634, 'cFHYORUe44skGSPZEUwfFQXHemAPg0bXCJAmlFT2GPDqFqOmAzEroY0pYlmbU0kbDeGoR5FEwjxvz9WN5i5h7fTbN3OslOU7wBEwPtCHh0wTJpXagaZOxjrpQNlDZUtMXPfWT3XApjwC8mwuc6BHdQPV5ODBhbD6JjkTqrza3dkAIygQi3xoNU6lKUaQAQPDcNlvY5ETtxyVCz4xX5miYO2aipcJWioG2E5kzSyZtkWERtKLk55RzqgzaYG2mfS', 3, 1, 1417410440932);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (635, '5PCtXxo1eNWvshPzSbMv2Q3WUAx0SFlITNzQbbAbMPdrgSELQ8xhkDegEobYPrhXOVYe0u2E7W5mET8SnjrpTg2tfYZTg98DRrsmZrS5ZVEuStZGdeBPu4qtZQ0n2sJMDoBsU1k5gkQ0okPdXSENyIo1eielgn24eLhGVOOehhPnFx7wGX5OGcMEosAkNKuHWiS32dovZCf1erRpVDKNNqnntbxLe1PnQJyUyxq9BfBoV1NkFzBO04ZL37vyX9s', 3, 1, 1417410465951);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (636, 'jPIn4HL0fIurrgB5yVIJqNLv939DfHf4Dd6szsapakx4x6UKuGK8fSoI6byL6GzgNWB6ppdUWqYDizV7HtFiLPUgkZvzGYO04DKqeauejWpP26js0j1wvawk7lykTd3xIaDZTfyl4hlDQGuEpe5Hz9JXgmzFitidda9cCaAHMwBHONV4bSgxv0SegmrVw4l6Mlo5M9Wfc3sn5GKeC3gmifIwsr6axqEvxfRogGuJI7WfbF2egbxRnTpuFN7ShdJ', 3, 1, 1417410495774);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (637, 'YNZjGuZShMlZrwdPsx4eMfJy1DyDmrRNGUXO6XYwEf1kjza8LmDbQZKTQB9QoVxxPY08UtSMErzKnDD4yZQpbHwyWV3MgkCZFMkLuTPX1rp9lo8XuRn7Vpzl6vFQGa8Z54SYjH2GYhy2X9TbNUtLni30cXz5yqkYWNsO10bnZaXbr8uxAwA3NA4beTvgdROB4cOwrGqmJs73dIpyJLQwaZ16kmETmciIRxHXlVmQHPKNr6wvXcpCYMkfBV9Bbgs', 3, 1, 1417410556102);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (638, 'iEq3NAtj4Ye8zJhALHQvhpu54yIBUWkfmHmThU4ALZhqC3SaB7GJPpCeIBJSa8XKpuwxHU1FDEHxS34bIEsuUFjbvdGnzdG2WRuinB2nArETk2LgOUgjd3SMMIeBJh1VZGwTerx9DF4nm23IWaqttpc4bC79J6LmkEHyukmTEDDuOmUHSU4KL9uYugvUEY5EdkCaJ6iS7ivP5PmEI4eLLXM8keoRPgFoaZyNPsuflRxGCIuu2FgQoqwzztKpPM3', 3, 1, 1417410694413);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (639, 'BQsG0DPcGfYkq6guOFR1oYOSrzmEXwDxxlkDIMHeVczA8kZjWvG2VPW9lEOI8Gx9SpSGY4N7BN1nl2pn39AuPSn8dGxJYlRM4bZKAmeLv9Bl7voqmi8gsiUYfDyZmuNV7ejkGdhLXlAD1wqzpLPJ52XgEB7azN070DWfUQbqc99E4f87AmjMIGMdJmfyOjCXPgpbby7YXJJH9mhVP0NOE1jPwuLpKB1hpPntFKCFQL3a9ROrMPkkCpMf1YxJV4O', 3, 1, 1417410707223);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (640, 'V2SXgCo1LRXIYzV5UzrDXZIijT8yNZ9gphshndl2JEHo6dHhg0jAQ5Vnq5IsynzvL5LNS11XmIpQ1Fkmv95FPOMbTuBS4FhiHYYh9rnSXfgtAJ3s3F9KByFuQIjA0UDRYwFHUEJMJZU2W7DBTmFnSGpAlKW0emZSDZYqZqDUQhUfzCI4jc11w6Rd6dPs8NGI5RMmS5uQdm3wXYsogT4sT9XtyvrZYxuefnFjlNJtCSFDQ1SF1YYpW6Se1uQVzz7', 3, 1, 1417410721827);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (641, 'CBqmVPLHnkX4P0IfGFwnVXikbBgS1299TEJsRwoqFKgbsZJVCLdhIM0a9HnRuHXwQoBEQlTLYTiNJ9VXtexzDQGoNzf7OXDFW2lexa2dJcJwdjXJRyYLRsvVq4FufXzPCnQWSXsmR6XEmI3r1SouzJoKFoBUOeKDpKlG0NYlcdCQSzRbclTTWxhKBxkG8iczm2HtEFEVT0dSsOUtzLLPLr37SjtfieD5CNoCZ8O8NSzO8mvmWnFpCEnYKZ6kfXH', 3, 1, 1417414737947);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (642, 'QePqgGCncIErJIM8bEjpyft2DagmRY36WqVvjVkjrn0BTGNrv4D15zfrBtsacgV3NgVHg9TvZcB9oHxhiYfyyY2VR2YUhweekYGvR3bVtMpf2LzLhzr3noFbzFiI3yPHVWmvzu8AtBLtTCjTesLFHZauTB2AYRMM8FDZmeHQt1AWV90WHgUrbZKFc54XMLR3OsnCuCx3C6nJi7kZayRVK6iunWBrjEzVeMZOo2L6Gz5qWk47alF9RwvzxITBrlW', 3, 1, 1417414741316);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (643, '8JP3Nx6AgoAlLhMQxm0DfJOlvEy3Ak6YbVppYcw2BFcT63glqXCdmpVQ4XePuaEq48fuY55UpkmHtHsBU8BynRInVVLNFwCaf0idkFv7KMqD8cIGIO75VAUlYu2FnyQOvnBjkilevy014IiKMHBQr4M2fiZn1ZcTMiSIIlM8jcRA01kVUprnV9XRTbdroXxpaQ0DdBI6S06kYRvFqSkosZAxP9QDWwuW2KQozXySoO3Uu2lVBhZUJXZyVSzA9Ne', 3, 1, 1417414770595);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (644, 'A9Wcf8OwaGjMn6HhjsLmnjjDfiWxKNo1gknNUyzalmD1UMal0Cm6hgMl2w5ccYIH8e37FHoa2qx1N4KgCXfZKMcWLt8zCUZQFfJNbEaca9MUvjUR01nDLZ9LKdY2jDLSdVXYF2A4jZzCMxusU5kBonEL4H7q4exs7ikfWgO4kLbBAQBg9735St5uw3lcqaN7sewRHaXJArWFwFKMlVf0vPO6gUUgEy7zoHZNp94JDN8uBmvAKN9r5upsNqrQoBm', 3, 1, 1417414862210);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (645, 'zk59smTOyqtbhUR6Ia9z7RsJOflhRnTWjsQoLVbnPIEpzOeVdtUU8pXkvBPppFlNGT8TnsUjOCu5JeV3jn0Jhx1qqqKYwBIZFaUTatM5CqyTDgVfvl85BeAQ8lFONKkNnMfh4iirzGwpQBG4DiO2NpY03k2biitkppaySYJ2RJ2962FmLOBno70qkoVsFXN35Z0SNRPJf404NojOH1Lerp2UTya6CCVFk6Z592ycRzGRsWElE6TcdqVcoz5lN7l', 3, 1, 1417414900508);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (646, '62MumfV7heMDgE3efMraZ3NQ6W7lzQLJXD4SNdMfbHVCDk0RSHUJWpBFz2fQR94wyPxOLPa8WaUlZuzJl6WarJQdXvwW8wD5CMK9LOOCYJK3N7b6fi7qNVvtvezw2TBhVefaZsf9dhDMN7IyyBagYQV6O8pTibK2gqeC7I9BeVh51avr8vv0P8TIsgLR0OGuu47AOY1s5W5ka14bAWlZWh2JVzhau7UsZWXJT4WswTtADUYzAms507ALpAmChXF', 3, 1, 1417414904824);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (647, 'QzMVz8QedjzJXY6iDPcff9BJTctVQezpsywdUyKZbcD72QoF50OFVqBzocbUq69mhUOKeN81HrVy5yxivFosz4ztWaQkWI9cIFy0YMrbizlYDdyZs3DtPYJxMiulGrLJopHGE4Un8bEcQ3r8TdSmwM9O07iOc7MjmPBI4kkmPDLpMFAPnQD5ZlQfZzp0qG1AanjHf3P8sCQFYH9Z5g12k5ImRsVGBWlkylMtBMu9xjvvbDM8I8KfshQKorup64B', 3, 1, 1417415445274);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (648, 'h6FEW9YgMwKx8JkSZN5TJMLNDwXaevPFThglQ9EXvbP9XcU7DG7paBBWD01ynOMzJ3C0QagZt5up3dw8RpR5687CV9EUIHRADAhGpM1Z9l5twcqs7jpTtSIitrR9eLLbAmBrO8ASH1IcBk3Ld1pwHFlXekXpYwoNIscf8q9p6L6AgzKqjoES2mnxgtf1d6vy0GaAMd74bM1stJugHQ9Yuyh77bHa9fYuHeZ9Atw4Q5RbfI3EBcR1PQFNZ3STOUG', 3, 1, 1417415531102);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (649, 'b1oEVl2tvJaWkniRiivBzos3z4RHqRCJi5OFEeqLxepZy8OTJFiFjk8KB0B5C0vvP4plpI1aZC2TbU75DFP3eKpuD0pKQgt9MBHrrcZCNaSsRZIpBd9SENC6oK2vU0uAD4kHuC6EuRBWHY0rwg7eiTCaUKLBj670H8qjb6hqrFQdpLxLt9oOPtFbJ6QY32IxcwI9qk7OQQjiutBiz3Pg0u8LIGFOk9mGGhMkrQEk0MzXU75FFXkBztruqMlupTR', 3, 1, 1417415588100);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (650, 'gygC3kiw6VtVYmDOD1mCni7W7qIIxBEyl1qP75M4MpSKGbsCWXh1WzvxpyBWqYlTCOUs4WxGZKd44s2G1iPsgCfrU5duHPJ2EEWwjzcHjExVvcZWwvISto8EDIqU7ldToxPQfZgiziSvpO6GW4rW1PZgw7DkvV34LE0iWjvG33wE1As0ROTpbGl0lJZ3Ev6xvg6XKZrsSgiQaZse5ycG4mtMzo07BW0RnuaL0Bo8idKeqnOV2IOYcNnUeJCbYZS', 3, 1, 1417415592672);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (651, 'NQPpQETQSxzKI1yEgEJortG4EctfacV2wTvzNN3VBCPvLheqHzH8EVbiANR6xLKKj9DWNjXZWr7X2Yw836HDhSTgPbYacALDUPrZVaEbUqvTiDZKTdyISG2pWaLPCV4Tu5SkscCciW0dN4jIwgoXrHApg88xQEZGK4UIkgeXx62ZJxmPYHUmm8wLGssx4rLKMyS9VuB9ojo8kVjgNalquLPzzeRVDIvC3ZevnwxcnsETZgG0AAZys98J75MYy1j', 3, 1, 1417415612630);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (652, 'WGXOdj2D27zwhvjr5cL4clM2W2U5TlUuOdD5O2QWs5wYdH3Y6qgtoSK5tUNestvDpRdHe0fZrB1IRjntR5OLhRdcU4HfsDODofY9zpZpwWBGmxVzphTU5ViCz5OyGRckCOdyOSRZwpeTTiV1CwhwlPF3njFj07qoNgCRjzodEcRzJJMWEDIGAuygGXvxDh5firidyiBqZBgTz6t9S4hEnarvb75zDZA54huR5sxToUxf0iVFbVVZcmPEbOvHVxR', 3, 1, 1417415615586);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (653, 'x3BAu41ySj5wq8FUc3IdInTihyGUf2UQ1HUXlva1sFsUe3dR6Br3sGukh99kpzH8dNnfDQT0MgnGdOAALOWfjyrJjhyGsoE8kskBkY9oXnK8gABcMqEE47HIJwiOiiJOOmvhMvuxJ6gUTuNdbgttZ6Z9foKTMJ1939qf02tlUscZ5wvPksS6BbPKBANWN4KUuRZJt0fbrpD73jQkc4Aj9nGECFTQ49YIRMTKzyRo9GmC4HvHH8TrfN4x7Ls4HJw', 3, 1, 1417415643318);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (654, 'qUREZQpxeTH0cjflCBFFuGCxqnwkb8Af1kngZROuJoaZgvdYxHq6Vlrpj5gBeIujNvaAg1iMyyehftBiuitAiI6WqMZL98mMKt5fZ4zU1zuIkYvlvLRO0ElbCWH59DdzI7c5svKALU9Qrw2vA7anuXHcaWtxfMQWKsuGVtgU9CggJWgLcbNvk92AUODq5RZMoce5M4D5FUFsGdMs3hTK73Y0DgIuQ2rY8fGnlTYPXcWNu8SDN9omdVkmAc46QW3', 3, 1, 1417415646081);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (655, 'KcBroyQS9MzH0gIIiuPeQwkP3vLuzxRu9vU9kGUH7tF8ogGap0nT0kNnz4T1c6L9vKctmQa4cikGNEP18CUXa193Q4vKZmvGeGzEGRO87OUkeP7E9JpO67cWYrT8LzE6xsraWJiXHhCo2mCZ3UEZLeln7V2Qh1NTMEQKQIN2blr4ClyjB8E3VLUlciyPznbCNuznjTwzsqDkNPWeYp5AuvNPhaEMxF5hw2PPLzSyg97Pan6ZTgmliIfQoQjSEcu', 3, 1, 1417415733540);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (656, '2oRM6Eumr7KLYRZT2RhDbLk5HISlt1CsxoLxuUAViQCAdulDL9CkrSZ0sHRpduJ9T60WGiLtW5D4d2pn00d3OhmAZKhyov7LEyPjoyUrNtSjlqjQRnEanTZ2ULQvPM8Mr92XSjX38ircz0qDSpQNNCvz8hooXDAnCDH28rybNDqtIV7JRNa3Lgd3qkHmk0KiJHB6jQ0nvCFgRKf6okQTvXckyeKhWffhZauuRAZRRRzzBY4OcWqDc6H7Eqhz0mB', 3, 1, 1417415787394);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (657, 'lARBoJQzMn68MKXTZIHd6rHC69KatskgC40hRX7vjisblQwXpscYzJX3GpL6SLxieiPdgsopuUradi9gUyKfWY324Eeu2NQaTxLTRCvqEaw5jrBqroCBrwYdmAakSDxa1euacVFQOUvNbd7kcTti5LuqtCWpXt3ZsNET5AdfcoxFZMLc4WsFpHD9Z8xnx5kp8MNtD1L2qUEZpeV9mSIeiGgbUaLtXdFpBh5Y9ynD77ZYzKbageUSSSpABG8yd8X', 3, 1, 1417415800821);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (658, 'KReUDC839nweOtqe0Wfjq2g4wxDSxsxMQgAtBurxZXbcbEcCsSMe6jSztENntsrDS8gT39YrxWJfrBhEYCmkkD32nCdQR21TdEdtMGgBmaROF3suSFwGKxHV7IduH6396yxzLeu33Z8oou9TowEb6bFxR8iXLXfE37UBnNptmmOUYKuF4Zjc8ZNiljdWQRGVD6g0vBFvVyvOYvEWwOCihVO42XWpGfIiTZVluIiKN7eCRaPeO4bfPKy8KHvwnKZ', 3, 1, 1417415804856);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (659, 'sXp76JQl6NWpRM3W6V4g8KmjF8O99Uk5364tFk9GdS93y2z8TclN3NWPjgynqMG1wcFxcWdw3czSN0vTVQsHdE9ZHZ1a0KYZsYcm9x18lwO2sw5cqCCiCpAz05jvA1H3mxkvBa2z4drr8G1zMMwnvY5Dz8Go88h0Pzu7EE94w7DaUnKkNrw35iNyO9htBDrDGHHgC6nqEoQdOdL8E3jRJAdvOYgXVIc8vBy9QQw4RQqSq2Xo1wK1PF6iEYdN2ta', 3, 1, 1417415807313);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (660, 'DKLbnoPjfUbKzhQicSJAoLWnOMaFBmcI7V8d82vx9edTSvJtfW340fXPtKpkVKzzxZ6Eff99AmVl2tyWI2GRR0wgvT3Rjr2A5jzoZmk3ma9VjxLgUjIvQayGOUcKpJSFvWxuyJpYDRVe8dpIlRehOE74Obl6EirYQe1aU5NpKtVbIcXPcw4SMD7aK74ZjaeEmOhLmQNUiQXw2hXmjMtP05ZvD20FnPmeo4cyEqMbUjVw4Cum9YqiwleNOWEms7K', 3, 1, 1417415814456);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (661, 'hjtxCa4orlNLbmcO8iPqYN36aksYqpIFuUwMHA6vCfEne51SC45PHcUrNU9FiBrQ8b6Pi8YGrTheeTxhc7maehT5EWuMpJkGThZ6gm7cSL5GU2y0JuRROgPiCRAu2LJfkkoAzI9R8X9OylQVozvh9RqDZ6XtdfXV5aAo4rgXi5tMbBVzfvRYMllfKeLpryl6MPIkkbGlCaAEokg0zBoMIVNO8MI2hM10PjxwfqGD3FPlOOsMRkdRkLNiHx9TZOg', 3, 1, 1417415830434);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (662, 'RYNYLJai09g8vSGJkZOGZc8omcLFyxzGeh8KTYOzowhdEdXRbp810pWFU0YN9WbhZVSqcS6QCEB98k3lPSEVJu6teNylJIe712jDwZ1IOpfetgAK96Li38LxjbjuinGybyw0oeOrD8rDuQOdsq5yMDag1qghxTP8whtYwjHITh1zpw6ymmxfIT7wtC2RCNkM3bDuUXGWMHLJew8GxJyx1INv95WDcgXJ5V2eoH3zuMjxgA3mZz8qDG0NgKgBfJJ', 3, 1, 1417415833722);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (663, '9lElaJuUtQTZj8u7YQtQbAjepyit2eRggbAPPgePq5CkjGf265U3OfeVdvcnx6h1wIBq60FxNa8IfjizPLO7SmEa7MRmtakmgimmXGcP479a3M86eBfYIZVjbLa333MgnQgbn2UKcrQ2PHtx1gNPlFPepzQH9ntBr0aX8kRS9s8FnUZlwa09VATuNmMTvsVERAWYrueqqVo5iOGyapvAPyyAaDb6Qu6xdZWWBD96DcHyYtZLZ0Zy0RBXPP1esYP', 3, 1, 1417415839275);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (664, 'SAmFm5jpjGUZrBtiptwO8vVTAiI3zBVdsVfksNdP9XeiRlypHoaT4k8Tkb1HFBE9HANtGVjJ1WPxyZrl74PdypYwX8XYgmWuifpudG3Cq49zcMiioMbtnW1pV6yGMYqIoUt51amjEJjKsiaNUNwq2BkBRINOmHQsLNcv06HzB5mL3iZlrs7DcDHYu16WUuLLBejUEPQHLvYB9Ql811FiTp5ej9t37VqzAWYxxny7u7YaaD1IIB7JKpGYRDhq4Ay', 3, 1, 1417415842423);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (665, 'ND5d1zurQEyLszT42gHgu5IcI5LWcpPZopwJ9YfCgYpqODYPxUtdYwqt3RhBfXAnfTgEZTeDTcBGjIKJc2HQrjygBxkzW4gePJ6YXukQnUDi2mgeJzLlhG7zckwH0Hf86S0CtEwB764QQAijufG9NuKbiT3vJ2btv8jbLQJ0KLSeyW2fF0UILmZWiEM1cATbWX03O38xYvBAqMMfFt1D9eJULgOQgjpdrH7ZKvvOnraTE2BB900nngkbn7qWiSU', 3, 1, 1417415917145);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (666, 'ez107SVOhW0so0emP9A4fCrcG98C5LimloEboOEOkNa87MPnmucx3B2Org4kCPoSheOgdiE2blzbzmheGOLdur1QJKnkU0sm4vZ06b3dqncztGrCXLUT7RipUwegLhPCGvvK9yQiPeTULdkTA1h60X1LDznrSFbZpABrl2yeOyLfOhraqjcYSw3v3mqm2T8IUcUpD9buqaEPhEnZuMroGW8lbFonzOGjK7YX7NS81d4uc1jMZwO8N8PtbGzuvJL', 3, 1, 1417416000820);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (667, 'nub73hyec6TLyNZ2gJijG0JCIT65sCvVyrZ5QP6ES0PM2oJMXEQjmrR0zUU20yZ6D8krJYnbJHjV0Rdz3dQzMwB4aWj1n1cUN0Rzp5BzEjMwjcrqyOxkSfMbog5VOrbTKG5LVADngK8Ogy8zm68BLKL5SRfmkAq1D2vlWY0g04HV6jHOc8jjXXJGY3aczH6CcE7ligSd8x40qNDhPqmcS9aHDKs9ers6UPtYLMjGhOsg3dogoHzcxPgEc9JmQJL', 3, 1, 1417416025036);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (668, 'KYZdjJxAz741AoHNwWT5u4YNWGK0bGn3bzCxGDtmouL2JtqT47wBi1Y3KMSwzcQFnJiu3dMP2T21X7PUU4NuNxHWhF5BYqEFMtvrNNUnddyAxbdbQxIMCpJfv4cPHI9hm1lJsyn3nF7YSoixO4NXC2tK7IRmn8AN6ZVxEAs6UDzB3nRPhiFw3EF0ciJwMjBcde3ZX5aIiB3V3WJR8sfM1QtdVTk0FG2gvK5t23yTub93m1kFPYRwycLHMV3oIOW', 3, 1, 1417416080272);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (669, '0kkU7NNzXxkNbytMD1uR8YTuM3byP2NuHCNktMTtoC1loTA4c0pVXIbqGHHFj137kBPedIEf8garGYsQF09HFfLBaFxAYLeNI8eyvNx4T9uUwRAhggmywSn0BUKdANTMXqXAfjjPnfs3kJNCCmzMSU2QGzDr2K9nPFE9rMEXuwc93iuWML6Q9WCQx7Bm9WT1L7WucM5Wv4CMde4C6djKzqBo4hLXoA4jMBcCpc2hXCbpLavwtVSbodZ2A2N5oWl', 3, 1, 1417416089529);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (670, 'ukzJdOK8uxcAFPnX52OwYo2CgCzi5Pkgwqzrh4By4pdPdJOxRbW3hwcK2mcKrNQ3QEjlvgXRYgdktjKxiOiy1JYTtck26sZGB1f1uu8nhUBvfkFjwjhlqLpJzWVfbfQbjnpRNKv5qhY0eEIC85tE4zXzU8KTS8YTVCQC1VapVRv5Ju3ztXB4hgdhAeMZkVWCM7wYRpNSjt7AUghBHWv5TD20OtoDiMVvP8EgJZLhZHlQBdL5vfbblo9TPZai2ar', 3, 1, 1417416093980);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (671, 'cTEOIJiHrxmSk27uaRc0PTipYAPjZXSOLWD4OAE3vXxW19RabsChDALetohUVJtkDjkcf3BWMosjCltQABbwCp4LDZv2gO9lnmKq87y7GmKjatq1hcYpdFd8r8RlLWd54uvd684UdjxvOny0Xdjod9LeTMMDanUsyBU3DjNPW7mDrAVHGItmHrosaa3j2Iflxv6G51ltEh2Wc9tYlpYFJbc8mH4uWpNxGbbbOmM9I9YiFmV4qGln05xuh5qfbGm', 3, 1, 1417416163133);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (672, 'f0sUecLRLNQC1hCtoxcWM2mgcH9tiW2DdVcPaWZUVoOdndMbs6uGqfVHlM6sNRy2UyUYYG1b1HyBonupHxjlt4GNWiWGX0Ge9IO1pwE0quwVxHcICnAwlileocoOxtIL96iuCj3BxoRXAYBWd9lQ4n1E5KRgtvfcrlaAIfpiIjC6W6wrQR2etU7UdK68Vxrx6nCxUFesnzsi3vAg85HjAPsmDRkw93r6GgG0BwqrjurQ6BoxzAPV7qVd7MvF8V0', 3, 1, 1417416166550);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (673, 'WTfbNNAV3UG8ImrG5X4Ol2XnJ1HkwYuMEqiGVZbCmtcJzz55kFkmV28bBil92GuLlWQqMEEkug3ImcUT3Bat0eNmDyQeOpXSfUl55vTXIJoD8LZD3u3Ts5hlOGhFOUDkg5TnJp7j1ebuMEGFJRQvWogWIqpe0ZeEEHtEC6vyTxhZioh0pOaJG1f0QC2GZPEvwgfDQPfdSKmo4opBe8vXLRTTJaOeqRZnmrgOeRLP4cVMkPXtVFHT2xCDTDWtyPd', 3, 1, 1417416170688);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (674, '8pnJVE8LoTwO5Letfu6QP6y5IgFo6s7gyb1gDYk0jaJpRRtURAGzlQWHjxrfZ5mGLsFCdir57coL6ljY7fxZHfVkr2pBATHq7mB3HIYAUqYRl9zPeWaMlBjtDG6qQ2MH1qaO8iUnOa6deHX7OZqlM4vg5PLjk5jLukINaqf2wkLBdvQypwUAQLpms10M2V0MmyGgZD1CTPKDo8SThH2EHVc41EOqocwqODkw4Iiih5jbxWpCukYeK3JnwU6XFhs', 3, 1, 1417416174383);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (675, 'eT2wvkxaL3Uyib11ugyuU4dj2dKaXiMFvZVGP7M8Z1x6cowHQUjeOpYZlyOa2o6aXsLPdYw1MvgpLueIC4z1Q2EyNqWb8fNgoFaJQMOTGghekLqfxvpDm9EHE4HXFXLPFME8syY0rChg22ohvhx3f9doQz1zvsYTw2XA0EfoYz5F6U0AjmvVdjDr3HF65Yxcf3Jq0rcGat1nJgSReoIcOti76jPwPd7FDgKn68vNBS1tEdUGfTbm2zfB4GAZ0qh', 3, 1, 1417416189810);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (676, '0TBN2snUGKAJE4aiyPlhzZr3UF3hwMgofZWfE8wJZB6VokFgWgtAufx811UFDlRqf0s4wiX6HUz21EK9OHM7dGw0VGbcwrE5fKhRsU8Salv3yc42ErHENCqKCoNMJ0dwA8WCgMsUPsba4JzQaqHlz2ryoJP8BqDgxnGhDgfSgfiEVvhUvkFTxLsLi4kdszT5ITTcFLt7KPEufpoEXz6kgHjcz7UGykMRhK4LNDFUP2Fu6TXvgoEhpDy3hv1acJu', 3, 1, 1417416193019);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (677, 'xPb2tNMwA0XKgvOFQXIxHXicTDaeV3nImoHBPNdj77ePUn0xGo2GFSi1GogbDPE5JIs4pTd3tQWP9p7GwWgYlA72X3GXCFZgDyXMIiHB24YtbbFSUk2orYZGlcz8ZD1dlvwOvATaKckMpJxNjnxyYx3R6nvq4iRjuzvpA8ek57YmXvOePoemff4QekKmRBX4RyJqT1Vn0F6bt3agc6FWnLj7U1azb0XQqXAj72IvoFfbg5U7xTAL00p49qdwiw9', 3, 1, 1417416197599);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (678, 'PMlA6sa5oYAn6qjtE1Q2PSmO29pTfH3kHULyBP8lWRa3k5aBh0Omauf2yy7LKOj6ARyoKFgBx0QB1oYPpvie1ImOXfMI6sPwN06SoNtPbCbBdGTVnMrMJujjaqv6Tp8DqZTDtPpTDBtKx04QqFJSBUHH22RRTEmZm8AMMET0b3ARsFuzlGdPMBgYI6KpFme17QWpw780tlc5PhlkoNMtmGjZNFYXjxZDUbJzvjHL4eTUt7ndPVvsPYFsziMSOH7', 3, 1, 1417416199426);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (679, 'm559O0eGh1O90qrgl10qUDPrCXaL3J9RsSW1zNeb0AEwnCLxoM4qFgdNqRtHXl4HXWOPJx4lrMoUitc2nh2UnSHyhz9nm2rbcdODSOSnYXUaFl7nEIZNCcUa0VuCQCYX0Oi8hLD0zW1Be8wlWeSaClp5fOU0ytkWVsSbZDhXd4U2P66bnaHdPXDq2gNoYp8R3uXPbZNLUiXEpFjG34gtFjLdzQA9ySa066LcPluvjKtI4qGLpCwijRrqI3M61Wc', 3, 1, 1417416234251);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (680, '3Va9ZBTBM9SE7FkoiSkeIHmD1pHrubvV96owJotpI59lCnNYoXfhQ8QjiJe2zcQeaExEUtRVKAS8ERhxVLMfnNUFJwv08xLT4szfgRGvcKs4Z60BNq1frarFt9zkCpzXhEoU2FTpACePa36SjOVCZucpe0Xfzpwk4tqDZH7ClKN4uiiCPpeZOjwBQxnH1J7sYboREIB7Soy1YaNwSw6V1hRJsyv1Ausb9p3uvz7nub23mpVsPLbEiN7oJHBjDRS', 3, 1, 1417416236981);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (681, 'n1OYk9odYNmvdySHu6ySFlJMoJJlCqtGD3PCGCY6MEorE93x4MXnk18mDCiEjUvDVjdD5t3LNxZ7DklcSltAUJfyX97LWFwMhuYSjAYI05KZbRHYQzr5mVimyiGj2sN6g8YgADi35kLr7Nw40iBfzL562EgOOyaEAJasZ0zMYAC7FoFOBWfedij5S2t6ip71PwTzYSBOnd76QpFUybTaL7vkUkl4zkHdiAVAtCmkNdstjFvwqPtcCAxZ9rbIVhy', 3, 1, 1417416299873);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (682, 'nQ1fPEv6mG3jJsANCU6KFFnebgbLQc7qlCHO3QzmLmvdbxQtba4RQ9ENrWEGoEhfkQW7JXhNJhajdC5A09AWThCcOYiuzdua7W2RnqGddPLTw3u7okyHRgLjOYE4hDBpBIfak0jOGaC9W9XIP9u8uJ3gPNPBeeiFsbMzvPfqCFsMLbVzaOjoc6FqaPaVHyM3xrW69sWLSttRig4aD7fwwOsV1o8htAfDEPLs0nW1pij0Zn1wsXZ6SaRo3myu8XO', 3, 1, 1417416833056);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (683, 'V2YVYCXXvxXzR7pE1DmSp2oGxovmVBvIWsZlZkMQm92rbPdZzrBfZb6ZT3xq3pTeh5u6AmeiuLdZC5v6wnQcIF4uuy6M5joerhZGrGX1Vgljtic5Llmztv1o4wLb2GcG0fvNSR2nq492iTetceuLqUcIszqiYEzKCHkflwP2G7BIG5U2VeCAcT3c70sKc8cxfYBMZpvTmR50KEqAuxtRq7C6O4ATAp7u3ye0R8LUhaCcY83NeTvnsM43tXvM48p', 3, 1, 1417416834749);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (684, '0IoRZuM8RD5mqLx3CFebW4F1Ci4crdMohzdvgDrWunzTEGxg0i3k6H4oNFK0lEQe9dQggod3rWE5CbNPn6pFFTlgLSOpESUkgKL2ObLLKi7AKsv01T0DlJ1upKlRHtL4ZvgDSmnzyf3dCppJXFVACQXOHZ6lCdgqDQkBWaZDmgf5dvCGgRolmsSBW5nZbg3KLqUqW3v4RgfDX2vLaKu75n0kkAw88rUottKNLPJhjfGp3eOY83F6OIN0TEKpvQd', 3, 1, 1417416839991);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (685, 'rBEEIVYKrcahbhFmEjL0jlNxrZWCeApF9B4V9Dv1Ran3F30qJaZSawQSZoL87A823DRUeww3aUPaURrJIVaCgLaQiLTYtwFqNnnMRw5PGlTPXk1JnHnmezWFDS7wQfQIroK38pSeitQILJUSZoFchgdWto4ZigNCa7Fyl8PLpZ3VkVg8AhqZmJEDCdfRNg6pXmiv3JnGjUnzyTElPl1sTXxuAkwRMIOQnT3x0AMfxfAqVUPkNme3b8f6aHpksYW', 3, 1, 1417416842814);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (686, '1NQpkjvpIorFIllmo3uFd7KOb5l641fImPm63rjcevpMZYf00ixj85W48YmJwM33h6lMRGJlEoWwEAk2YwZomdRAfHVslZ1SWJ4NqAiRaK3OHvhi58R5VCIYqOVXCWOy2lknj8fqIoYRRlAka4GIfmHYFpLQo5AJytDskD1PkUuKU5KGqrew2LJhFr5bLcb9IvEJ6sEwCSKjymqXfUybSUmxQtEnXhKQ7geoq8LMJKJBSIgdiDvJzCRswhN460R', 3, 1, 1417416868991);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (687, 'Xx8QK68mveC1w2BP9fTap5wSB0IACBhutkmjPyC2wzrZpN1yef8RrjpxD8UxMi2Uygi1zE2eXMd5H7FkwesQW2nyGatASGRTKp0gmip89xQnH9rYVradKSkKdjqoE1gnWpYyomn6K3VzjsOyfqr062tBzs5OGnFnvkXRI9Z2WqMOUTf9uZO1Q42jiMt2ik128HsgP1NE7umzKrE9I5XhxsQyjqBlkrO5EQ85EJeoCuF2w3bHtGlcWDLL1Cep00x', 3, 1, 1417416879910);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (688, 'znbYmxoYqVXSJyvwpDR5nerrhtilzubjwYqtwVmS2CFzMTsM6Ii8R1iKeLMyf1wThMaegOvdMEeRqWYw3IU70yyihHVl9KfgmuXGWL1U3i0A5tjvmDJBXeqkjicJCt2gxBc1d8hpM1G6VyoyoTKjN4j6iyiYn4scMqo8G3OxWdj2dNe9UMQn8chdpa2mBU6y72pPpbQ1TPmRBGhUPggNtgqaEqVudpAwlEpeXXg7vV3nsiMXhGULXoJzBstvWKX', 3, 1, 1417416882654);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (689, 'R4usaxOLBDZtq6ppTmGoqstzg0Q6L4yIRqYNytzzRg9oKH3TOzzHCYNhcQdmF33l4DJ4Wn2OSHrP6U2Yo5a1dU4a31HYcg4rVQKjjDxyXGA5PuUfwsw7HXhBYctHb65ktTG0Ss2jlpFKMK03DoX4AHJYae7IEVDTBvpNQuBUCPtuQEid6LrUOtFTdUZUHfPKZQzkfrcbsR34UZ3WJhexQDXu7kZP9AixqVj82Q1LXxC8TieKrjwARcS16mlLsMy', 3, 1, 1417416884669);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (690, 'SYXlSPuRH70XHnh123A8alX0AutvnA1pQuLsCObCrj1ViEfL0m3DhDaltMCv0PhIKkwlId1XjW2WPhsJM832yIRPb1xLawR4nCcnhBmkXrmVshmRJuFRRJWuUwxmvSeR0wIUfV2LBX4uJIt8IeOIaojSPvLQRvBsv9ZL60zoCFWGuh6GaC8bYYOAbldqwCyJp8QigKfSDDZp8kCZZpZrGBMr2JaNPAgq88uXjbqWAtpbnEssV0l3QJMmCr0ueEq', 3, 1, 1417416889092);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (691, 't4ohxQ3ym1Tid7GlpaZWkIGHjGmX9Nm0YZjgPYphfJY5EyyKUJLRl5qDBp0oMi14DoevcaCKzSHnqrEf25vcgVg0drbmo5KiqZKEBgJDnXF1gwhZnGznmItXWHgjq7CRUiJnbFJM542oTguEE1lT7qqlhCHZdkHQwCjDhlxNPTyvvFaEjp1J8XU25CF6lFSfeCFY8e1GmQF8QzL6XjVdBxKF3yD1wk6rWUzXgCJ2c5btW9gkNbMoukqp5gr40Qe', 3, 1, 1417416896517);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (692, 'ctl43k76kPK1adsRQzxGWrBJJXUJLqfxJF7aWoiYICqSIfOwBU2fEkILBioOAHL0aToAY5490BsjgIpSpuhgobnVpoQdTjxx8n7TijbpPIzXziARPS4Tw6BUOtUQFxw9bbL5Mm7mL3z7uhGihYokGbpl9FS2gtOwtzsMgmfBTRheDsFoNW7Huwv3VhdK9ar2z4NjL6sXUPV5u2LDTYQki7am5Jhd8rDqnXdQLJM0OVHsYqBQlRrfhgD6SwUg9xo', 3, 1, 1417416900033);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (693, 'qB6vUyf3U1GiZ5CmidGcIYhnCHhwLj7SlmOqDs8MsEdVHDeIRB4V92GRELqQmgwRtVEV1Ms8CPeUXEwtxg5H37k4qLEv7Rj3WVsen0RsRFDufbhzggILfVPWN9NVSnc3DWrNXTuSQrLOWFoTu8Dcs7y7V8IM7U3JUYrTUHqRqlPhpH4l4oSBkwKsteJ57UOjAF2FN3q2I3KO69cScSfnr7ROJhQxUj2FTpiJKHEu1zOHgYUO75wHhKESD6U3sxM', 3, 1, 1417417841110);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (694, '62pu1zlzAsciJipgaRyALNZIyAsoJftQNXswylH23xXtMsJkQaEeL70mpqlY7bKLcj96rF1nqanuGK7sD0wHwfuFFtejOsVtV2oU22ckLzNGtcRPDVIaCU7TGcywk7csnrdA0NeH60J69iP5UjPdTW12scL47tNYx9OU882wen2uqDiyTXut5FF8TzKzyIkdSithqbjndHWo8T7JSpQEW3mkFgTkF5S6eWmpK65jysBvNuOaH1sjr0H6PgIRowT', 3, 1, 1417417841661);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (695, 'shxeOATjuAwf4zzq1RveIBBWKKK5Lttvkg5ZzPAbyS2Ua7zelz6t9n0vMbnL3pw3fgsOXD7eUrzdd2kZieMAsBN9WJ8v0tqiXv6zedHpHqdkeoTsttjmilJs01x1sey4YkxljLIII1KyayQ2hdZjP0OsiWO6EGuahYtgMeJWwJwiOnF00nYicApjj69wflM1tcjxioTiqLNDdyjeKc0U2kmKMOQfBT8b8UKiisWwUyc26EuK4NpTV99vNJvB9Cz', 3, 1, 1417417843050);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (696, 'hr6N1TffFx45XxicGDaqlRNHQavgkmcGYOFVMcs8kophaPa67pJ5epTFDaTUwpE3wdVJiRGiSIt37nh7S74GfEUL9jDv2oXXpx2nxua92aXyAUzQNGLZ8CaVX2aIMqlKFwWCkrHDDMG8l3pmJcAqyK3GJHeRQ5BzGocGQm07jwDYGW83r8cDLY2OgqEcPahu7W1U4YGBolFHFGKVQ7ABiW6Ss6kd9drD4uKJvxRfhbNlu87tnHYyspWOGnJaffw', 3, 1, 1417417843836);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (697, 'J49jUOOx0tAAFW4nIQ7O9ZwApenR9KpfvEBimpxosx6JTlLLG7anopVaatocTE0lAPtWyJcUgbCh7kx7b9VOiVA0PHxLCe7QlLDBWKFOIqef3C0HsPYFnS1jncTCyTNlsnSYkDX62u7LS836o44UrlWYlMjLkN8W7Q6FcB9XCpwv2did0J187TIaXsU3D7MWpRpHt7Vf31CifJeGWP7qlgkOvViZ7q4ZAsPny30gMAX1E3qMJifGjOjVgRE4DSz', 3, 1, 1417417845191);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (698, 'scac3fsqLSHVpYaKnLsWs89bW010wLgqRG2WstUebXNQEj02fejrLEkIZwnJXCey3nMcH5OPnEXAnn2P6QLAy1H2hCnIHO8nrPfhzp5NMlMc2muHMOq66QlxMdcyM3b3Bta1rBLIDdgQPl66bG12FsewL2kyLRMDHQ8sRR8Xt7j84leqM29XOcSFNlweyGUyRxwfSfT2GU0aAGma7ZYhXofdxFBIfdb1dxPxL2djQBbssrlBP3psAySGLDSWE2P', 3, 1, 1417417846295);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (699, 'QQFla3VoUnE1k5pjcAqmHoM1Xdz3LnIuFHHZgdWXW8blL91wUmaKp8ifzShFdWzEbo7j7111YOMAWR6N72qHvfdvSMbBeqfywweEZqvaSY5oMfllWr196Ha4DYk1by1KC3f2N1cUV369stGHnecDVnCiCUr9PcTWZbTLQPKEBhvviP9afeKlYhfC9lIzPisHDOwe8yAGXvQNy7x2gz1nnEP0OA2ScCvMC58wS4qtCWtjWlKBciTPOG1JBNdeOKk', 3, 1, 1417417847967);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (700, 'IZh0cW540KPFSzv70ziIFA3BWHz3Ly5DDpiSiIVELIpHPM4jHu2toGEd17HHvQFLdnK1UD5ENNADVzpGDYPRdIiJTaQQGSTVO9xqKJEhOTlWAPh4G4b2CgT9JadX2AjzJpBiU6xFCqJ0sbkALA7PQ3yHgyGt5LNari3g9J4a2wBcIxe5F9rMXPrfvCo5IZRSqQfYuk9bXCquKndVgEX0Cbrlf9r2lPGPXZQjSMxJQOQcmDDA6FXGl8rQWCFhfui', 3, 1, 1417417848950);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (701, 'gTp2asMT6dCubcuTie67zxgte6run5pXhWyoMYpZXb5UtonL5BrUQoWkZCe4RT8Ifijea64Z5tCS995BnB12AYaxtprvX7zV0NurgD0Me3hi6xidgl3Bi3iyIrhZSRL3MKitCpaxGBO6QYQEdlgiHO05ZLHpuLr2TGYPP6dSeva6KaEZ1XPrT7aURojRPkQsZWXHneOzlgUN6jcAzWXoPfsNbQ76kbjn0Hejacgk0NDnq8BpvEiX17bluC64gMj', 3, 1, 1417417850279);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (702, 'd5i5Lnb6mq0lkIUtegROOyLwYgmXt5xX7nHGCWJPuN3J6vnieUhAEsKOB09MDGvwHTiqUs1eIJZQApC95bVAa4WHcHuEd9yz2e3p2EL4gdldyHSdZQnMj9HxDiOy9Zr3kcNmmzbPYOnDmTbaHLN4S7ElIWQpz1tti8Ou8ToANsGpvvb20ZZut0eXwwPcANZyAlrqcGs4mOP1HVPwOq3T8wJUIB7snmKhrtw4vw7nev4G17kTjS3NxAJuQ4Fim1E', 3, 1, 1417417851332);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (703, 'otEJT6pRxKX7aS34J5Fe9ak4VUeYsVWFnpF5Z483ucej1WhEsuARx9JgWUg8Wz40FAvW2qTsRNnydkPTaBg2reZnUGWFgZk4PAqF1HcNVbmSizXHsZURn6VyH4hqB9bB7WWRtplCW8VxkJcO5qI42qoVlideTqkW7Ee3MNncoJOJnAD8OaqtJW378WBR81lzNU6Uhvg4hSl4Urmzm5iX2ocgHCOet9ZIyLkqcIszpKbp7L8MRbZ9E3IIfsbpbxG', 3, 1, 1417417858387);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (704, 'VR503laqdKiPJUWxpYA4Btz5Fz7wSRnTe23FBqt8J9YXkRKW6eCSbaMJDa5ql2iAdnBgzr67BA3RCBXbmWer4goUekqp36CIEjYtGYLqSD613UpFc5Toc5MYS34Iov9prlXq1jAtSpEf5ajzN1MwdKcmt4ik6A2SQjFvD7rxUdrOh2odorxbe9ek6bgEauRE6hsAOvI5PdaVbJs1BOHPJJJtVjaq8mnQDeXoheMsdB2iCLvq1GH9VMuYj6HLC9w', 3, 1, 1417417859811);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (705, 'EtrdBuURbG7BQ1xpTRS9eyu5ZhTuK55qbfQUu7sj5290p89Xsw9ayyJxwpC8tbDGtgDb9OObf86cg8f61BWQYsgdmzZYfkDVwq7AXwambaF1uwevULSdWRkxkm4M5UrDi8W5eVUSdjrLkmNuaj7ll6vhExP8pvxtNrgoLgYw7wlDdndsiknkIxfx7ssiXpXFnvlJOmv7U2qWriJKYAST6mI0PJNJmNeB8DPbvjkUV84XMqsCSsozLdsBBTDj6RD', 3, 1, 1417417860584);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (706, 'YFSDfBqeHQ1iALpLUZhxsaKz8A2XnbasSvBvkKoMV3sJn9neuSyZ7bBz6R40cjrtPy0K8xPbCpYmipj0XTqUcWxZ37Cr5tH7QV6hlNnNRZshuNHbBeydarxifKBdNdYLWgYjQ4vsk4hBh09b6i2tJQVhVftVi9vKYeSfdAmT8nvet3kPfLsEzLxM4WrjwNXw0UNvDmX9U32MD1rvU6a8sX25IxvrpeTXyR8XN0eFsMN4or163Wyr3c5jjgakXpv', 3, 1, 1417417862013);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (707, 'F1ClJRoHkElGMrayCV5G8GtdlmAwlHGPZ578NhadIqKym9f9ZgagV6aQmLBEWigwpKUBIIRpVrc8qEt959WWk5OjL4SgpQKjFbyvNRLjIx7hYt8JLIGNTt2k9ulIor5zOvnpTYsGaeNG1800CHaI8rHpZhsGLBtzUSRMWNjz4qmSaSM3lQctCGdC8EnqblgEkVpJXD7PkgCm9k6IV4JmQ7cut6PF8hqwXreIl3A819L3HyVu6MS6sDgVbNkJ7sX', 3, 1, 1417417862639);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (708, 'xGwBJXW7CNyvy7Y0o7pn9oiooYyiw6SFiGtnyOp7brhMcxiUm9xO66HUJ9XXM4VhBj3MA3wD0J5JM0vfcoWnu1KiG25Avjbm0iBihk11fisXzP4KeElPRbBrKrqttOJYX03qXMC5cgkIp4VVHxdy258iIUqNaAFRbJ8P1Deno44qVyY3y2VEcY4M2Q3j0rc6CZczVqVi9md90RJSd0LmqVNDmFdpXFxCPyomCYyJvfRUADcMKvWlNj4grVLfz0t', 3, 1, 1417417863893);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (709, 'pGtavinvlb2CfsD9tgZ6bumtpbRdf41ajMNmNyhBH6129dXTkzASIMhFrFF8XXQEFnwYjinHVkrHh1TSC09nHWhJg6WxlIXB3KBRHxUrK4IN8djdbw99pEzI6atpXrBDzMTYx0zUXBiVIXr6MPOWyggSZ9XJciwqLHELyPXBng7padWJAp51g6b85srb2ZN9grvuHtuF3VbjF98ST6XnAZ4QMaNEIdSp483LukOgr3is2XiZTkLbPFwJqnw4BRQ', 3, 1, 1417417865078);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (710, 'uiEawRc1Mkl1LPSLYmHVXYbLI4PokHW04NwRZnFg7KQkxXmdn6krWAihzwZFCyuE3I9WXixVYtUQjopHumQmm4ybZGMzjmrj56ypnRBn6g104tPNE5kRgVidrbzYCnBZmBKkCD8NB6vcVlP7kRmVp569UCjNmXTLLAoRKMiLc0uBvhbDmEdmKkw9eJsVkKgHL91YOLkNoL4uJFo0cJIt1lTEenAMW1VLXtVhuQTQwVvq2Bsv24CzRkF31c0g6CX', 3, 1, 1417417866267);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (711, 'olzVN4cRJSs4HILnshRYHxfMDTvtofXB5uw6qXmLRYtYaMaNSRCIcfOSw1meCcB3dQS9TK9zGv1bhwIOE45ebwGg9fioQnyNBbthecEq7wNjiOnOfwva6SeBcaA935o9LPLaASSqHcXwZyyvs8e1asvXA6M0v8OrrEOWe07f9qGRnd8WJFwFNbCuzDVLjrPsgJZ36hGOQS4qgRRh3bcLos2hZOBDH6GAHhB97Ge48v6Flj5iXlM9eUV8OELYykI', 3, 1, 1417417867158);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (712, '9xiI0cR1f0n5pOZdxXHgua2eWyiM2GErBXbOCLjoDXl35XjBH9YYa64CQCbdg8QcZ6RhnWkbBdXTYDtp0KxHo63fFj7n1dOhy8WLTcSj4i5UduTmpeXE2QpzSaAPfwFXIc33wRvX5nqL8lPwyYM9oBaBgT25ptrJK9z6OHTPmEwmyTlxoc1j1UGue2JxszgIHTzOHyazp3WGwTEqSdSIF4ORMRoqUyIM8gJaQFwneKZ9B39alGWiHGMofHMYN9h', 3, 1, 1417417868565);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (713, 'g8rC4amyK1LPjlWnjedilhrp2WaIVKMlsaPnbbDSe5RGJxfG9RgldRsIIGbFszXL1FdWgEvoVwrpanCPW1QfVYiOl7JtpoKX5d8Vyq6SLPiCnR6kITAgGdIRHkiqqJZFtegErmTWOwWE7c5kIaMnPK73nrPDMvwU3g6QicotNBy1UahWXVIObS18M1Oe0gCCn3GgDFowSBPdCFK0YUxSvFk9CLhMQet4ZJGQWm3pivKgaEB7lbkjZbxD7OFRXno', 3, 1, 1417417869701);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (714, 'TfbLI14iO6ZFVeVi7FFcL0QnwcobIW6UEHPEMGeuy1CBqDHccpCGbqhfMFdSeF595ZIqcbviU2srWP8hz9BBtkL6djMTx5YTTwh1g9pAvYeG2WdDEPOAUaA6DdXAwssEDzGeo7egzhEFznm05QXZ5IHVbeouF0P2cUJ08AcUBhoifqUOZTCoPR0NdkBuKPH4evlztuEiTA2hPGL10GfUIugNDwtIza5hE3tpYh8OLhzkJktdDvnH4BZEfoFwvY4', 3, 1, 1417417870617);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (715, 'Te3vjkWnNHsAnrQbyCakZyUwec93zZjNp4diPBsuEV7qy0OcprkebULFFW7OZDZv9430lZ6d1r6XcHgO8qDnQMoxD4tBceIc45yTiQE6TmLDYNeTqbjaJukhaFwO2Q75NVIrWNwWp7PJtdCu4ESQGcIBB7mU7jZOM1m3PcBcnwhfGutG6GtxiVYrXKUCH99IHVC0DnPSGN4AzQKeR9f1dLGGpzDErrnMCWynufBRPBV6OOrqi0rIOQhGgyLeYku', 3, 1, 1417417871317);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (716, 'O6kuzr9XudlyBNyHD2aAYFv8DkDx71U629ZP3jS2vHQAol4v0XvA7CTlziyFpIS3iIkZn1RxQLC5ioax7wAuSnmYFy6ci96cw8qnwP1hqCKuAqX0YNC2xPZ1HjmCswfTHancaIlBKugYvrDZnj2d4lG6wyqyorRSfx5fRVBANRFi4Yl9kJkNd2wGqVeFOt8ktSd4Imbpu11eQZMm96lJSH7Cs0cmRnzfjJXWhbxZa4Rji3CGDxeC7bsPCdx3VZA', 3, 1, 1417417872756);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (717, 'hEZJAm2seWjQeCkyKUbuSt096nxMYygZ5yBILjfqnzfkBX0V9ocoBOJadELSPCvz93iYMCkbh8L5BFgcOsYmjFbFeaH0536kCdUT2xK0DwK77bwk61jexX764Kupfw0zYZtNOD9lxwTPYKovUsHAWWfgmLH1fCOHr7XsE2OjB8sNFCyGztDu9b1MPgoxcREr4qBpmrQMPGczeLF0W1CtVn32hzD7RruPl5LnCrGP4u3UYlXpjk4itcLjskJc6dw', 3, 1, 1417417874206);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (718, 'I5tfPcq0skz8Dmb2IrJyiaySgZZMZROSr0EmSu9jDbkrbdl8XfcFpMWwnVQ0sACMnOtIlLDb3fPM94JcKlfq0RjtNZAJWYQ9J9gQLtwnOVhZnS8bmTEx47Tp5UGgOSAYVCTNyEPqfOxjAqbAlg5ZHXxQdbKG8gwl1ZuGQXMEuyykRsGDz93vNd101Sk3AuV4Kz01ei9kXQAEpagUV1XBsw6WyQosQBBkR4hd3yvdCL1fFtFTtJXGAyOjZz3ezgY', 3, 1, 1417417875608);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (719, '3fPTAxz5T3LdYFIEDiGz4oEv5I6v1Cv9t9jMaJDxd7OXSEJv6g7kNFkNNLiqxF6D2SIUpxjdYhznKxsFXMvCos1VouQlh7eEnsodEjC8IeowibebD5jf6fE4cuP7PMvtdNid1zvuCMt5NDeItMGMgvy4dJvkpnkYEZMaM4oFk7HlT8IOgf83qTVvTDgDFje241QBCUPYbUlFMJmUfADhhLRJHe8zhGH4VBKaSbFlDdMnJ4gQ2AEeaq8bUwyFO0V', 3, 1, 1417417876653);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (720, 'BKTv0i6gGXTckvyCQfX3D0Yx1rNXkp0j91Fuc1b8bwtVZr0Xx8ZwydIIKonxSlx1w3CMbJ0ISvCtR0oPdLhmenSCTyJKgmu08UxEV83af2sGANgTACNmeS3ZPvX8xtalxQEVXp4hNvJsAlz62BAzNpQpRJsvamAeZiAMf1usP3o56xyJewowysur5ZUZFxJYXyEnAV06XAJwWIFD7IHs4MvKnl1w29eLzjCk4gu1grw7LKqRqoAonIZaxxDwHPZ', 3, 1, 1417417878103);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (721, 'UEHePTXGsOuINECLT3PC1hcY6bHdp8claWkxp5DJpgbVKSlQyyHH5y2ACr4edqDeTKlo4p2h7kzB2xFTLcjlhUL7BiDAa5UU4zCuLDDc9JVFAYzzOqwvkXhuHvpdecNBJhDSvC9SVRvTL73F85YLPWjQCx9zRHKvMOY2l1kezl40dldKjBsSPlkLNlhKEM8ApHIUNpc3M8iRGc9inuOhg46pnbTO6lNnowtm2CY5jZHVGJQsR79NB8m4D3gyCO1', 3, 1, 1417417879845);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (722, 'PM0CjPY9EDvTGtz34w8iCgrSpan8ChljkGaCuRpkaT6tUnxgbRDRDJE5BMc9G3VZkSz22ZSkxWFwTfvdD4qfjM1LoELHDPWr9tFLCMOAPi9Jx8Zln14Pf941P5gA60ho2e7mb6LS8yqyOzABuGdGVbpmtIl5sXMujMVA5CiQ31b4eCveC4Dsm8UFT5AdmRF5KyQ2i0qLj1J0TLqqvvaMLsbNVKgle8qA6zxZ3YoRfrk5JqkLEzw8sXVf5pXLwQb', 3, 1, 1417417881159);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (723, 'X82DGjbavWITfNHQzyksvYoEiPnPvEUE41j5SyKjJKVkqg4AWez5U0CZXubuFwVlgvrF57mbrgMaotS7D4i7pNcleqUTU3n0ospmLjqhikcyS1IELZRx00sabve9yL4cWY5uaBYc6JaUVGzZA1In50h9DOW2m0PxaJSgS2yRNacOXgKLBgeLKib8zARJqQKtUKV5805dl4OLp712h71LbXClrmH1ajNQOk1yLkh0TVOxGFD6aK2WbmfJisJsHqV', 3, 1, 1417417882249);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (724, 'gjezRmybjT4kKKody9q4F60SC8oxJJ6bpJSVD49m9g6Gr13clLzFJA4b6kdJWcdVT4Z35boR8WOsQOGaV70nxToNcvO1oW10QebJfphZnAE5rM3ixfGLsFUfasN5Qgil1TT4if2UTfsB63enEZlnjdaYr4DmXqG4aJ6MlGzIcz7PjouYd92uIf0WOtEJCa65GyQhpipQWCKY1caVTKVCSdrVdFBPjad8NHVYRgFyZQxFKyyJSnBA78NvkLXFgp9', 3, 1, 1417417883712);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (725, 'Ka7A4fvEa8fNDqqhNpx9MRpsdIr2Rr10u9doHaL2UIWnxoymA0R2fpnh287milWjZ0f72LX7Elc8uiUkUBX1CzhXUv2vxZg6XcFKo911PxjGY6a8k5EZcXzPtFCNL1y7I3xpdjeNEAnmiFu8ABpLu1hfLAloQN4zjQIZRehJTABEAcumUfOWSpzFTnPBsKvRd8hLEOPYrqCShGYxM0P8mitcR8qHTF4Eo8vn1RtKq1CLMoc51Uds8eO9u6I0KWq', 3, 1, 1417417884513);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (726, 'pqQFMCCYmT3GG328rWMBtb6l67IqVjipdWAo7ucilwdkrsFo7Uhg7GgCfR5RwLDj9KQcNFEIiyQEefmjNvfDjvgkZOQltHD7ji3yVWus9nTJTmLSxAdXRzsw6ecX6MinCNQtEFxC1g7KjZUXgrnDLz05TcgaE6jGhnalIfYCzDcACpLS2Z2vXbOSUKtjRAwSKOCuCQf9uc8GK88NZRmQsf6pi1SdQWziRlYd4gbZJLkk0WjoEm2sbGd64JiO8lz', 3, 1, 1417417888725);
INSERT INTO [refreshtokens] ([id], [token], [user_id], [client_id], [expires]) VALUES (727, 'eew56Hke04y9j0IxoIr83p5bYo8EErstFVjb9JEs7rdJg1WuYdADWUc53CvI1z0E5CZIFiVWD77Vvs5VtQsb3tZXTZP8WKt271xwWPR0Rtyt7LofDAbWeA7a6L4Tae2HYgWQoQyb2QFvZ0d3Cb6QnDGjzsW34rehUZUROoVYFmh43BGiqIAcF3Oxdqq2C4FEat1kkaDA9dNLPkthiMAdegDwQe5yOqqTtyoMcp3RRkGtaHcR63WfGI0ECgYoSfe', 3, 1, 1417417890008);

-- Table: do_relation
CREATE TABLE do_relation ( 
    drcode VARCHAR( 10 )   PRIMARY KEY,
    drdesc VARCHAR( 128 ) 
);


-- Table: do
CREATE TABLE do ( 
    doid      NUMERIC( 12, 0 )  PRIMARY KEY,
    dccode    VARCHAR( 10 )     DEFAULT ( 'DO' ) 
                                REFERENCES do_class ( dccode ),
    dorecid   NUMERIC( 12, 0 ),
    dorecuuid VARCHAR( 36 ) 
);

INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (0, 'EO', 0, 0);
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (1, 'DO', 1, 'cb4e0c17-299c-4982-a83c-887b3ba65dd1');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (2, 'DO', 2, '53637fd1-13d1-4c76-a956-0b3479d93303');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (3, 'DO', 3, 'b33fa2ac-d349-41ee-ba7c-2d3a8d7798d7');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (4, 'DO', 4, '8a0616d6-c815-43ea-b386-b22d64c7a106');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (5, 'DO', 5, '90f00f2d-d384-44d3-b00a-43d4732d9100');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (6, 'DO', 6, 'ea31ab23-8fb3-4b3b-84d4-e5aedb311662');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (7, 'DO', 7, '90476938-cb6c-4dd3-88d4-568924cdf96d');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (8, 'DO', 8, 'f973ba03-3c9b-4875-8c91-e6fa226a91e2');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (9, 'DO', 10, '2b11521f-52e5-4246-974b-dbccbc8da0ba');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (10, 'DO', 11, 'ac759af9-2e71-4ed0-a47f-fd4959b7f46d');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (11, 'DO', 12, 'a078692d-187e-41b0-a948-bef001716102');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (12, 'DO', 14, '15f8015f-d74a-4450-8f21-46d1aa1cc0cf');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (13, 'DO', 15, '2c025b3d-53e9-47fc-8a70-a34c805a81ed');
INSERT INTO [do] ([doid], [dccode], [dorecid], [dorecuuid]) VALUES (14, 'DO', 16, 'b269154f-9129-4a52-a274-31b6cf2f116c');

-- Table: do_do
CREATE TABLE do_do ( 
    doid    NUMERIC( 12, 0 )  REFERENCES do,
    reldoid NUMERIC( 12, 0 )  REFERENCES do,
    drcode  VARCHAR( 10 )     DEFAULT ( 'PARENT' ) 
                              REFERENCES do_relation ( drcode ),
    ddsort  NUMERIC( 12, 0 ),
    ddleft  NUMERIC( 12, 0 ),
    ddright NUMERIC( 12, 0 ),
    PRIMARY KEY ( doid, reldoid, drcode ) 
);

INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 1, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 2, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 3, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 4, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 5, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 6, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 7, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 8, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 9, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 10, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 11, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 12, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 13, 'PARENT', null, null, null);
INSERT INTO [do_do] ([doid], [reldoid], [drcode], [ddsort], [ddleft], [ddright]) VALUES (0, 14, 'PARENT', null, null, null);

-- Index: posts_slug_unique
CREATE UNIQUE INDEX posts_slug_unique ON posts ( 
    slug 
);


-- Index: users_slug_unique
CREATE UNIQUE INDEX users_slug_unique ON users ( 
    slug 
);


-- Index: users_email_unique
CREATE UNIQUE INDEX users_email_unique ON users ( 
    email 
);


-- Index: settings_key_unique
CREATE UNIQUE INDEX settings_key_unique ON settings ( 
    [key] 
);


-- Index: tags_slug_unique
CREATE UNIQUE INDEX tags_slug_unique ON tags ( 
    slug 
);


-- Index: apps_name_unique
CREATE UNIQUE INDEX apps_name_unique ON apps ( 
    name 
);


-- Index: apps_slug_unique
CREATE UNIQUE INDEX apps_slug_unique ON apps ( 
    slug 
);


-- Index: app_settings_key_unique
CREATE UNIQUE INDEX app_settings_key_unique ON app_settings ( 
    [key] 
);


-- Index: clients_name_unique
CREATE UNIQUE INDEX clients_name_unique ON clients ( 
    name 
);


-- Index: clients_slug_unique
CREATE UNIQUE INDEX clients_slug_unique ON clients ( 
    slug 
);


-- Index: clients_secret_unique
CREATE UNIQUE INDEX clients_secret_unique ON clients ( 
    secret 
);


-- Index: accesstokens_token_unique
CREATE UNIQUE INDEX accesstokens_token_unique ON accesstokens ( 
    token 
);


-- Index: refreshtokens_token_unique
CREATE UNIQUE INDEX refreshtokens_token_unique ON refreshtokens ( 
    token 
);

